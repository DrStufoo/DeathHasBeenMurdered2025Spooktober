Shader "UI/AnimatedGrain"
{
    Properties
    {
        _GrainIntensity ("Grain Intensity", Range(0, 1)) = 0.1
        _GrainScale ("Grain Scale", Range(1, 10)) = 5
        _AnimTime ("Anim Time", Float) = 0
    }
    
    SubShader
    {
        Tags { "Queue"="Overlay" "RenderType"="Transparent" }
        Blend SrcAlpha OneMinusSrcAlpha
        ZWrite Off
        
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            float _GrainIntensity;
            float _GrainScale;
            float _AnimTime;
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
            
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
            
            float random(float2 uv)
            {
                return frac(sin(dot(uv + _AnimTime, float2(12.9898, 78.233))) * 43758.5453);
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                float2 grainUV = i.uv * _GrainScale;
                float grain = random(grainUV) * _GrainIntensity;
                return fixed4(grain, grain, grain, grain);
            }
            ENDCG
        }
    }
}
