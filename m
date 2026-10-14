Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE64E780C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987422; cv=none; b=C2Widp+vIRMYFE9+SEVJu/4+WTItZtJ9Z0WtTdDkyaZ6W6P+nxCR5YCWiQ7UCoas5Ans6012ynPqzZSVLuBUl+KSLrFk7y0KIy06KlNkhZM1NmoV5oBliTsi7+b1rJJH/onkoJLhwHMg3K8lQaFIaFJUVZlDfLOSA6IqDq+/Hr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987422; c=relaxed/simple;
	bh=bgHFfuc6EdWx8rSax2do4tdHnzY0R4ikfH/Rh1vNpvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbsTzcYGRFbhkIrNstXeK8D+RAFNFaVpyMQmbIBBGfIS83pxQJZot0IvIJW6XhSSOOFe8JtV46tF1qcxHkZHIoxkCfqfBa7+mfVBjm7Sa0w6HKxCjHGwjbiqm+f2AzZm0PkTRCFyCHvF/ymvfyLS/orh//6VZY07W1u9W/GatxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbunqgzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WieiaPbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbunqgzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WieiaPbh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8i3wT3000877
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=; b=jbunqgzc2+ZMmLGg
	qrJcujJBn4ImqbJeT7hSI5C+Wr2JE+nO3OoEothkkYkrghXs4apP/kczkvCoFrdC
	0LVtX6j5mOU8dBHIDrbiuKY0eMeBq0aTaF2BPTRAKzWcRjYiInvllL3tU+4aKelr
	D4P4QWoyyyllQEkrQ9IcAoC+KfPAbkZp186EGQ5AmtkjuVKIOVwjG52iVO6LbVzO
	uVJBfCcgWbA+bBAFyX8L/oUefCG8jSrtlM0ry0VA7V3pTjVYVSzFqWrRDrMai3re
	lpu0RjuJhhE26iQbsR/aZI2ts7JjS2z/yRF/C1bdfHDkBdsnP2WphcQ8T10TySge
	mGL3lw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbevbjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:17:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99062be02ddso127615241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987419; x=1792592219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=;
        b=WieiaPbh/8LvBXZonfRGNhs54EgKCoLdSqQZB0rVtj9lhiyMtnhXEerBPTQTOTlYqj
         fb9BqSu5xBT1fxuFwKApcYrFwoyyd97QqMV09bDV4PEhXrDtqoDvNO9nvxmWYWmv9Sva
         2Sm7Cweikrc49CgH9VxEmXOdEq7FYMFcGU6zBHe86byARNYKQGUDywAKew+y19fTWRR1
         phqfm8PCjcpgXHte1GYymo2XqP7Q1qntLnD1jlA3H4d9ivvPSfEIpT7zwL7tV4oI5nLe
         YoPwcCHjJMu4zY8ZJ6LB2TR7KljRHu19ehTtGffxZWJptcRL0dcd+ZDW6q/FAXsLGaT2
         6Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987419; x=1792592219;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c23MFofHP0klFIrGtzPvfehmbgdnuZ+gVK4BzbRbTsM=;
        b=fuN9IRrsvaHp3vqwlIGhUm4uT5yJgQ4C7Yhu8t5gnNPwg7NZEv4j+MUKzPQGaSWqmg
         8zmreDUDdRr/W4sm8EO0qye92z0eWH64L98+f+3SzU4DkInNoNuTt2TrLyhX/a7rL2id
         rFd2hYKL825EP6TF0ZXxeA0nvawpFXh/3AOR5v7AwFsqlpWKx7so7R4bizXVJtPiMXb/
         X1wid0Xx3bEY1DeJQSrWxb26eorMxLIxalhu1x1kwU7L0FYWcEkveNCGjijJBIZ0Hk0J
         L4ND1/M+BaCBXyzjIY4HFNc94vUvwLwhalcY4wxBOx70AOkMXUDBr+E/sQCNRP6M/qFy
         yq2w==
X-Forwarded-Encrypted: i=1; AKwUvByTegJcOVNQHMPjkESKpOvbe5O1YbPxVNDqtS+fLLaPy5Cd7L7cl9LoZ3y4N/drKZgltgGvjiWQ9XxJzXVB@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4bzreQDIjzT8oXOqNeAwlEGDP3+p4hONr3AZCgpcyH5i9AJim
	2/68dlnhcktRoTvuDi4JqFpsDNxixrWQLvAXIanqRbQTDx6govzRLEtPk8qHOnsV/HhUUdjdzjR
	fl2mCQr5yTGalud0wuM/WqTuHpCiQQMZ/076Fcv3lB9fIsVo5BbgPZcVN0uhAYYWjunR8
X-Gm-Gg: AYBFou3Th0fWznRa/OBdfDZS7fHDYMmQmbQf6iwomhaHesRb2K2qzPEUGlGz21MWn48
	JJfo4mv9DZMscivYoe5FEB4Zz5XmmB8cxC+tXNmA1hj3HcWGNR07RFTYKOuBzcZd3mUXDi/VsCN
	me4qfI4nDD2Oz7airfbgBpzsAkAbvQe25wY8rUVVqRT5c3niMj/8/MYsazerjp4vGWnip30qg+h
	gam1FOexSisr13AvLl1jPLckxtSAtJ15eBZBOrXZ7EMkPZEGw3nTDDYrWetuqS6irSRvkz6lBq9
	BlwH13Gjoo1X3b2pzqgYC+SoJCMcjVRGXfREjY9ZYWWgOv9TlODMLKuBL838oMvHk/vZwqjT9J5
	H/HfvuSTHW96G5T75U3HmZ2ZZu0zB9e6jpn9YF7grnZpMTdyyvet8x005tTANL1/95v0pt1kAg2
	pZDLKHFhfG9pJo4v5ItPbYMZzDutWJvnouSSBpZs5t3Jm7lInIJgHyxgJ2pQ+pn0s8AgM=
X-Received: by 2002:a05:6122:9001:b0:5ce:d56f:efac with SMTP id 71dfb90a1353d-5e91f54fab5mr5102419e0c.21.1791987418616;
        Wed, 14 Oct 2026 07:16:58 -0700 (PDT)
X-Received: by 2002:a05:6122:9001:b0:5ce:d56f:efac with SMTP id 71dfb90a1353d-5e91f54fab5mr5102224e0c.21.1791987413320;
        Wed, 14 Oct 2026 07:16:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm721182966b.79.2026.10.14.07.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:16:52 -0700 (PDT)
Message-ID: <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org
References: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fiAcdlzxMmGYo-uZvmQEJVFsOH7r8MYQ
X-Proofpoint-GUID: fiAcdlzxMmGYo-uZvmQEJVFsOH7r8MYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX3hbOulEPueac
 ZXxrJRLIa2J4AbKiFCriTYniK3RWbahbTTJEvPy+27hJogs0E2luYIWCQP/LgCIGsJZyXSh6dcB
 ldcl7IjMi9Ok32DsxMiZygjXTgBbgdMh2yzx07zTCm+TEm58QD1ydJ0aNpVzlrerXvf+oXjsOz2
 DS1L5BnqCa3GHU2X3PY5+GuS1BhEGvrgT8syUHaO+RN6erri5knpg/6d4Ld81nuSFbkYgqw+3SQ
 tz9EMxiOwyNs4IRNMRSkoPX36cdJBrLKO/xOkRexGQjo8mxV2d/alKmulXJmz9cniNmscEUrAtb
 MOk/r0+0Q0jZJm54a3LFq9TG8vZv/+kPWuVNfW2oLC1wb87q4lluHChJIdAF1Z045OP1+xkRLTk
 pw2UDngA6OD24wnWFwGNAVwAT0PqPiDCaFRlTx5OmNEXP3ns/X6R+H3ED2l3zIdUO5pOk6tgVPy
 ix/CtwQam71V7BQcbdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXxf/3HzlZoNHZ
 czSOuM/tGB0d78URG0o1rzynfiqE7WWGr7HMF5pr4fgCWw9ezzE1WmjPeh/kXTJHN7IiriF5Qn4
 SYoJOuZ2/m8CBg/SxS/rFXpl5ookERk=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf8edc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ISy6eMC9JirD1J4fssoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

Hi,

On 1-Oct-26 20:10, Daniel Lezcano wrote:
> Add thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> Add a passive thermal zone for the keyboard area, which is the main
> thermal constraint under sustained load. The EC reports a thermal alert
> at 57.85°C, so use this value as the passive trip point and allow the
> thermal framework to throttle all CPUs and the GPU when the threshold is
> reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> An earlier approach used staged CPU cluster throttling in an attempt to
> start thermal mitigation before reaching the target temperature. Testing
> did not show a significant improvement compared to throttling all CPUs at
> the EC thermal alert threshold. It also introduced a latency imbalance
> between the different CPU clusters, which could negatively affect
> workloads depending on where tasks are scheduled.
> 
> A more optimal solution would require a significantly more complex,
> system-wide approach, accounting for the workload distribution and the
> available power and thermal headroom across the CPU clusters and other
> devices. Such an approach would also require kernel mechanisms which are
> not currently available. Keep the thermal policy simple here and use a
> single passive trip, which at least ensures that the system is actively
> mitigated before reaching temperatures that could ultimately lead to a
> thermal shutdown.
> 
> The mitigation temperature is derived from the platform behaviour when
> using the balanced power profile available under Windows. A separate
> change will adjust this trip point dynamically according to events
> reported by the embedded controller. Name the trip
> "keyboard-ec-alert" so that the EC driver can identify the corresponding
> trip point in the device tree.
> 
> Also add a 73°C critical trip to shut the system down if the keyboard
> temperature reaches an unsafe level.
> 
> Add a thermal zone for the back cover with a 73°C critical shutdown
> trip.
> 
> Describe the SoC, SMB, SDX, east and west board temperature sensors as
> monitoring-only thermal zones.
> 
> Thermal camera measurements were also used to compare the reported
> temperatures with the physical temperature of the chassis. The measured
> values appear to primarily represent temperatures inside the enclosure
> rather than the user-contact surface temperature. No unsafe external
> surface temperature was observed during these tests, although this should
> not be considered a substitute for formal platform thermal qualification.
> 
> Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
> channels used by these thermal zones.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thank you for your work in this.

> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..5d3a0a5ead68 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -20,6 +20,81 @@ / {
>  	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	thermal-zones {

I believe all nodes should be shorted by label, then name which is why
the first node before this was "wcd938x: audio-codec" since "audio-codec"
starts with an a.

So this should be at the end of the global nodes.


> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		keyboard-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +				keyboard_ec_alert: keyboard-ec-alert {
> +					temperature = <57850>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&keyboard_ec_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		backcover-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				backcover-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		smb-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		sdx-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		east-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		west-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
> +
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  
> @@ -1612,6 +1687,36 @@ wwan_sw_en: wwan-sw-en-state {
>  	};
>  };
>  
> +&pmk8550_vadc {

Idem, referenced existing nodes should also be sorted
alphabetically, so this should be the first node after
the existing &pmc8380_5_gpios reference.

Regards,

Hans



> +	channel@144 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@145 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@146 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@147 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@148 {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@14a {
> +		qcom,adc-tm;
> +	};
> +
> +	channel@14b {
> +		qcom,adc-tm;
> +	};
> +};
> +
>  &usb_1_ss0_hsphy {
>  	vdd-supply = <&vreg_l3j_0p8>;
>  	vdda12-supply = <&vreg_l2j_1p2>;

