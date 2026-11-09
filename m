Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187632;
	b=o4+3u1kupoMiRk+3A7NucOsqOH9C9grDcIvNzLWAtQkAB6sWTdh0YSMc9AAKbs37dmq7
	 gg4Yl1eftHAus4GdXRsfZcZz657hJklTYyLHx98C/Ege6Ba6LoXmWd/YECHwRgb+hQep2
	 4RJRAVhB45oy2oReZlA0MN/OObPUajWTsptAz2xdhe/1ElEeDRvchxSUZQSG27qZl70K+
	 FzO+/6dA/KSsBfgFmsuYy3ocfzjodQbjUVvBNK12u2k66liirqotkSuqFBHZY4jXb/W1w
	 wbrttFLgLkRXw4D0sqEbSK2Az+0aKmgdKXBY6BtFkIyOtH/9zVk7FJbnA/ZuPo7EK4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=;
	b=iWiFOzATLRVSoOAaFA0hMJFXdCq6Wy4sUtNQ8O2kAiMLWrivlnDu1ePtpp/kT0N25Usf
	 kv7C/8SQtBawDrJFM3UAR2MGw0J0AyB4OTz8F6A+ErJQC1q5rVChEeWpmOxOMrbuE7O0P
	 iyMiFovReAzZACOjrnWWd0GW+JlDJKrRU8OCQWprwmVKo+8cb/JILIYrJO3PIOMJ3Ahc8
	 jZQVzduJgnDH2BJUFA23BpKSa4cO2hpDp0cnLAcGnva6thcXY57W63obnispJ6U1PYeuv
	 Ov04xoDV5nd9g+KZIfzfYIoJf0qN8qi7fvtBlD12YmZaZgPFnVsok+ig0gZFb/F4Xqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ivzqmk4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwCGA+hI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4343606CCDD
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 01:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4343606CCDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ivzqmk4q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwCGA+hI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90GxYB2551285
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 01:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=; b=ivzqmk4qatGy7/8L
	pLEEN1KfCxLLvehzD0iWk65u59aIkb/85qaOzfFP33vx18Lwi71Iiib8mU+BfFrg
	sucNpt3FqbPPiwg0KzoMFBdcWDtO8drXrUG1KXVUDK9bm8g/2P5sqJlS4Nvk/+aT
	/wKzAOcShXmUUObmS2m/sESClLGgyMp7ZTSW6NGeHFiR+lXYBhUKTiVySwoHX7cZ
	q2HsQMqNRDavn6iHO6eCxsXtTJHgAcho4wyF5mt0jJunIPjVppDve9rGYK6GZ0ye
	yFKyQEfpn5krI1dORx4K6VOaXLxsK3ZC4dCvNHiD50SAYBShGobrtxaC6EDO6NqQ
	vP2BvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagv90f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:27:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so6851145ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 17:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187630; x=1794792430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=;
        b=OwCGA+hIEVD17FjYQ6KTcxycA3wThBckjswG36NyD1wtmYXj5kpANfPqOaxCuCyiA7
         WsueNsmZUOn6AdvUhBeToXxwxHaTDH9XfwLpZdCGJO+74GLUf7gIdeX4/q+SN21HhCUN
         AMIrMmnzeFBmDRpl5md6W+EGP5WEfVdJocEhD9BD3qpONASrjFwOPO8/bzthZKAbvy3t
         GvE5OTTmVdpL9Zo2cWxCNzkvzhczeLN7jFwcOCY0g0aEZSPYpKmIRFhJQ7aFa8A1agwK
         qApPOfJnNk3QXHiqOQ6fO1h0qKmvdsvYZ+mp64ufJb2gTZymk2GO9rzklnZe1Ze83RyY
         mljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187630; x=1794792430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=;
        b=Z+Cviu5uGkM8j/6roB5mBeSYACr8zxdW6jYyvAMxByELTBP8hpddXHlf+odc1Eh+Sc
         KyVR10gWBCnelbK68ddWriVYfcUxNwdn26DbGvU9555tHeFN/oYmA8022Pvv521F080M
         EwvDzux3/L0yDfb8wNjsM44D24/pHA2Nn84s5GrWeHbgbZMReUuLpesZXvIYGReYCzbL
         /P0bGrkwTPLy9JB2JVtonnAZQDQYLhchi8sTmvs/MzAODiNOISFliu28MtxdPrBlwPmi
         7IXG4cmb5JbIrXA9DAzgaUh1uVqmuHjivAmfyrHCvIFcXkhHTJNlEJTy2Ghr9BfnzwbX
         KE6w==
X-Gm-Message-State: APuU4Z+OHMHE2bkXSc4LOuCW2wplaMbghnS3t3wrtcFWzhbnzIiNnG/3
	x5HbYNSo2+aF61nEebdHVn4Y0jXKu5Q3POij8922k6lPNvsEaVUh2vC4MulfJrafiBjyy6Iy/cb
	0WgGPHhnCYSD5G4qGw525MUq1q/Su7/YOB2mtJjBElQgzDimToxyo6KOea2jitYV9LZLa
X-Gm-Gg: AYBFou2bKMmaJmJUQjqHBPOa7hYFs7UfkToUDS14xeRqK8l++Hx56G82sU2yelpBKup
	SXKqdGGJPn2ko83OpVGdFsxUkaJXnBqs32jfG9WpC1qvw6DEYip1dfkWMJN2Y7bDp3s+9IXb8hY
	dMJCQkg5xxuA2q6pr/9xJ+pJ20ercpWCuw0G94aVB1F2UTlWn3i+uAguvVWxFJ+OcR4bKUH/RXE
	8ieAcykFnhFjZC6fEcaPFmUWlMSxpWnCbq4bczNK42oLiWsV7a2YzLfsNPgI3Lk/+YrRwYeN1Eb
	/ODJHq36NBlyh29kXDPBJas91k+V1AGVX9m6aJkPDTui4IyZl+jUat2KWdRlGs9HACiBH8dVXGU
	7ElLzcfl5rJvSJeecTrVr9FxR/mQwAWI8Ik8r8XniIwgpjaADQ2sLK+zY/iI3Xfa+TwTe
X-Received: by 2002:a17:903:90b:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2ed837970d0mr30013585ad.42.1794187629636;
        Sun, 08 Nov 2026 17:27:09 -0800 (PST)
X-Received: by 2002:a17:903:90b:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2ed837970d0mr30013235ad.42.1794187628850;
        Sun, 08 Nov 2026 17:27:08 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e7416sm6269005ad.17.2026.11.08.17.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:27:08 -0800 (PST)
Message-ID: <adfa64cb-bcdb-4dba-bb23-bd71f64f0825@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:27:04 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX6WXjOjVteO1d
 tRxxcDpRNmx7qXqJbI7n9CWHNWYsdkIh1CzBUigKZtTsuysiB5TFyICxRnr959u6OWWo1UuJHm5
 sRLxmRhBbmX+JsdF8BtJ6UXU1eldnZJauIcgsj6CHyOt9HPSUTtBaI1qs/AtXnIqC54Z8cfEsz5
 tzKGAfKffb7iLtU2Dm6VCFTfQBotYQ6aiILJwDKprmL/Vloz3s/htethYYDbkwEyG2SeLmtpqMJ
 ip7Y5p2hg5hzuvZFJcg8Puig/SxYwT/FTyJNEeJjAZiv2v8DHOAMq4M//VJ0B2rRAij7O1RG5iI
 6pRAofiE69cnIY9e5+9+O6gAsV5oMj0sGJJ/0XARo7eWQ59ucSyBmuYbhG63HHSCMdDV4zFbAMj
 9YAOmOzJTTp4iwmm3vltPvikxzROs+MY010BKpafxSfLS11zXe+kuSrSydKWIJm/vziUB2gHm6M
 TCTNqT9gLuIbn25hMeg==
X-Proofpoint-ORIG-GUID: fNMMN5TEA7_uWXsf2UvKS87zIgNpkytY
X-Proofpoint-GUID: fNMMN5TEA7_uWXsf2UvKS87zIgNpkytY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX1rvmEYyRCTyp
 p3m6epE545sJlacu6BW33/X1/b2qML+2oU5qvAxxRAfS+s6ySzCg94O6aEM0asyxlvgIBR1kS4e
 UzJPNx9HnD/HxltXmq4nUIqwphFCpWU=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1216e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YSVC6_zYCsoJ3GjGXcEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005



On 7/14/2026 4:05 PM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 

Gentle ping

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

