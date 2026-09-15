Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA43876DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459761; cv=none; b=tH1Y8nzrvJWazB2BSx6WHPgixetT0fts5J3gnFvk+inVv0C8QtgexuBCa0+TGQQLc3WF/+HMjNYOciit3e5l3dI9HwidjU+Ge0NOm/6MwWJXOV3XeLyGED81FCDRchEmg2xLgNKmcUZW/lArWdFhDFKfKEbFgl64N7sgFoJEgY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459761; c=relaxed/simple;
	bh=rAAdHLym2FN+o7S3RNpBgLFr76WhG/xObeJLRgMQXwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atT4F8t7XyyWUKsCHo6KzkpwYBdROnD1L8whKLV/c0tgUtNtRYds/ye9ouNYVxpx/oS9NysUsc8TK7u+9mro7zEcVUTl4Lbq36SOcHdMju81M8XCo1Wavv/8Oy7R2hsg/xqKZ1mxvJDM0GauKuoIG4893IrGmHRhINHpPsBcYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYXQNjIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c00FTr/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYXQNjIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c00FTr/Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7Ef2167825
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=; b=VYXQNjIf84mbQFeK
	NLnU51p4T3rJmVDgbFAURO3gpopMH+5Ik3gvd0BIND3o5+vJXbky1DB7BiqY7IJw
	Ja83cySsFPD+RT6zFfP9ZWD6HBDtN4+++bQMn5YKUmO/oxX/zcfQ2ox8Wr/sE1fL
	UDZeCDo5NLeUnqWLuEshZyFYUFos5MRMjd/M2mXG5ZKncMYa1/zZGPiQefMupCXG
	vanNZrubLnB8dXBIZWKhxcFBDcbO73ZSkHnOoXJuFcp9zhUALFWY/JQQOmhXQtKR
	kv92AfdHA3xWG5l7+oyHp+5tKLZdgVi4GnJCV2akrMISbOZAbY97smjjsAG1YmLO
	6l/kXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s90tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:09:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso54035375ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459758; x=1790064558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=;
        b=c00FTr/QqaS+e8KadsxaPr27BW6UG6iF+eKCpMaQZ1cjeT4kbuzrRXykqKeKmF3Z6i
         QuAoIsDy0GG3lBr/90bOEvRU1mFx6GANDO0dKr8UXo4YoCmEnGTRF8KxbBbXUCMECKgo
         CSd6oaG8BfNt7VPUFy5m3qF2Q4yiWK8w1tr8HB/b94C9QSCkcXXLlroFiWLrIJLm8APt
         xAJKJlQZOfNbCdV3BqoK56asit+q7EdHJr2zfB+kIKp7UqwNzzxGS9bwV4X8v60ZfjkB
         Pl6ZdiFdhnpYeLeHb7TomxCeVht3pW7sDF37YOiPLHOBkKaZjBiGHNj0PUHDXloNuY8I
         9kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459758; x=1790064558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=;
        b=pbnWfcDpv0wVhGnwOEvFW74Cs/WQmVoQ+3dHuHTH7ORVDDq4p/Oi0hf8Zxc+l06Sdk
         MoNramn0uScQRhOYM2hwJDCI57BIrzyw6tgMdFZBYI1p0Z8Az1xyLkhs6Z01gN9yRAqS
         RzDqVYuHb7UAAZxxpT+Cv+N//wwTIjyQfLDlhf51LDlypXjgQF66YbQbbZHwTd8olfzg
         R5dOIUCcw6Ggjz4zjx/lWXstE8R5rBRq4zFt4nOQRGLpIXbqyyYjod5Ef7RUcBAiDiIe
         4+0nkjttIYW6QFF9MMT4bcqeEIwzHsNTutCbFu/0ZBl8g+4ccETL4QqjagV9zDeheT9P
         Vv8w==
X-Gm-Message-State: AFuF++nr1JAqeguK/4aeweeAAsxNSw5aBIMtsoflu1wU7viOcvwer1nI
	9f/FjPO2f9aSukHZ0nvu/JnGUPD0uFX+LoCBtQnYkX3KbicBQIjxjCoUdWw6yMGOBxke3Sbs+/V
	jli92oYU1/EVmoe0Er65wp9sHKmNxAB7FgqyBCtmyyA2NeQuLIyAcl1k+za2NqtmqpcHd
X-Gm-Gg: AYBFou10sw690xT+9WtJWDJCaKkqfhP91VJmS+DEbeFZCPEMFy5TNfMOZChLQ5DZaOO
	Tpgavqzcdh2bw/tCYwL/lhhFed7rabArY8zn/sUfImF9b1bBmBfi/DlLiKGbQqhwBMcFyGXXok9
	eVquMkemAOAUA5GaLD66fAa7zSEG9LG7VO0xQZr5iEbwyl6RUxP+Z9gwedj5zD2jD2At21XMR7h
	OdCoWcx5UrS5g4Eubh4Ne1Xk0LpQPeREKzS6wEmegXNMVf5Xu/SsuJDJwfijB5kmLsf381aX7z/
	Ejm7XGRtYGeQR9PBN4t2zcHnNZUaeRjWsvwcXfOpD8kFMPxA3qb60rwPHqB3aWNnvsiNdqqr0KW
	H1KEgc1larqu+ET3UTvhTu6sXOpsGlOY8pa9f7ghyKqoVlleLnztP9pyGcrAa4nAQ5Q==
X-Received: by 2002:a17:902:e746:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd6c6dae8emr125563305ad.13.1789459758535;
        Tue, 15 Sep 2026 01:09:18 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd6c6dae8emr125562705ad.13.1789459758136;
        Tue, 15 Sep 2026 01:09:18 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff297esm61574725ad.73.2026.09.15.01.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:09:16 -0700 (PDT)
Message-ID: <4dc33440-133b-4b81-b460-4484d9829aee@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 16:09:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX6cmzgLNmPw0l
 ritA6Bcjz4Ouol6V/xNmkDLtdDGoBxZeljaGEmQ+H+BHNMfrQb+oayxeOVas4n/zE0dSdOBRwli
 RZzKt5zFgWy0/3ut5b7iC8itPBZHAG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX+MjehZ5M+OEz
 hjAoncCqF4A/xwcslqedCYYK2JY9i5u8NVYFBgt8wdbPS9+1lX0RWZqBBMQw0b+bVKTiUMomamO
 NxsdL6hGfROqrL8dKAnfwhRdmUKleWLaUkC+nuvYM6Q2R+fMvHxiO7v94yLLVrVH4oSyW2WkqPt
 fvbUM8Qc/qQ3TErD+n1Rj5JiYTz9/3r+jcuavuSfmZTB022cMJomkYxMWX14nKw6rkU0RsVCm8N
 JTIJXpiXxGfsxqBRLz6lAwxDYy6rAmp8Wsda/lX6X6rJd3eAHhSDCFXudQtvHITINH/nHjW9PJ/
 cjvDdXKzsDG4bdkGZTRA7yXu7s6PqZjOXnRNgWNpV43Ly8Xes7mnVasBiJ5/5V+dx7xDwE2S0fn
 qW2nBWEx84UaFRnQ68sTILIkEJ6ZLyoYuL+oiCFnl2DeBE3vOK0Vy9xlLFsgF/YRc0o1P2djvda
 /TfJQDr7yips0+bpTlw==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8fd2f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YSVC6_zYCsoJ3GjGXcEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: H3TXr5bMXiWty6PzfcfSZEkvsr5fzkuw
X-Proofpoint-ORIG-GUID: H3TXr5bMXiWty6PzfcfSZEkvsr5fzkuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116



On 7/14/2026 4:05 PM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 

Gentle ping.

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 176 ++++++++++++++++++++++++++++++++
>   1 file changed, 176 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 0bf664cd4b40..07a0b00dfb62 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -4984,6 +4984,35 @@ card-detect-pins {
>   			};
>   		};
>   
> +		ctcu@10001000 {
> +			compatible = "qcom,kaanapali-ctcu", "qcom,sa8775p-ctcu";
> +			reg = <0x0 0x10001000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ctcu_in0: endpoint {
> +						remote-endpoint = <&tmc_etr_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ctcu_in1: endpoint {
> +						remote-endpoint = <&tmc_etr1_out>;
> +					};
> +				};
> +			};
> +		};
> +
>   		stm@10002000 {
>   			compatible = "arm,coresight-stm", "arm,primecell";
>   			reg = <0x0 0x10002000 0x0 0x1000>,
> @@ -5123,6 +5152,121 @@ funnel_in0_out: endpoint {
>   			};
>   		};
>   
> +		replicator@10046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_qdss_in: endpoint {
> +						remote-endpoint = <&replicator_swao_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					replicator_qdss_out: endpoint {
> +						remote-endpoint = <&replicator_etr_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10048000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			iommus = <&apps_smmu 0x04e0 0x0>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					tmc_etr_in: endpoint {
> +						remote-endpoint = <&replicator_etr_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etr_out: endpoint {
> +						remote-endpoint = <&ctcu_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1004e000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1004e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_etr_in: endpoint {
> +						remote-endpoint = <&replicator_qdss_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					replicator_etr_out0: endpoint {
> +						remote-endpoint = <&tmc_etr_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					replicator_etr_out1: endpoint {
> +						remote-endpoint = <&tmc_etr1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@1004f000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1004f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			iommus = <&apps_smmu 0x0500 0x0>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					tmc_etr1_in: endpoint {
> +						remote-endpoint = <&replicator_etr_out1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etr1_out: endpoint {
> +						remote-endpoint = <&ctcu_in1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@11000000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x11000000 0x0 0x1000>;
> @@ -5937,6 +6081,38 @@ tmc_etf_in: endpoint {
>   					};
>   				};
>   			};
> +
> +			out-ports {
> +				port {
> +					tmc_etf_out: endpoint {
> +						remote-endpoint = <&replicator_swao_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11306000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11306000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_swao_in: endpoint {
> +						remote-endpoint = <&tmc_etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					replicator_swao_out0: endpoint {
> +						remote-endpoint = <&replicator_qdss_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		tpda@11308000 {
> 
> ---
> base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> change-id: 20260714-add-etr-ctcu-for-kaanapali-9aa6b297778c
> 
> Best regards,

