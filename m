Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773101;
	b=3j3BYJyYlxrw5c8UAnsSLrRSZrkKQd6/i3PyPPpELkEL8L8LozBmjQdGs2k1Qo3BQJmr
	 9NmQvsr4zs7yFTcjNcbQy5CFItUarzRYtnfcDFIojiBL2V6wyGsw77zqH5Yz2pg2F8N/I
	 h69baSG3bB/4z3wf9XxW1AkHqlR6gTK2Td2wUdiHmk/lAj1UrNXkiGsl67rxLKfRh0DEp
	 7+FfDh9nn9ypwGPqX8UIqy4nzThDatXzQJ+rhpei0RiKrq8crV7mc46qbKRiz+RT4bEy0
	 WGoPG8sJweAZ4+sEVh5jigU3ES8vy81WQZTN/CiOLAvBzOkhxcZtnFRVAXcClGT2X5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
	b=Evoy5fhl0BjTzsWMahSnFN13VV2G+g95cfYRppKcKCwg4ZT6LYjQZtuKwzwuNdPcfXBs
	 V5rtoRMZ/qxqrPlEUdLdUXgNGDpS8210r0gpY1STR3ytNNdBpJ9ZNFEvwp4wgW+gCYNMU
	 PyyvH0FQFjqnLflY8gRAXLVaA0n8tvQUjEYV0gAVOcIBo1ZskOB7G+hIjqdCihNr7RKZ+
	 cFXGzeUkV/A28XfhT3aSSmfWWVU/XMJgoGcf4KBelRMkTBqomC3EJ2eFQ2meBF0teaSxN
	 r/HhaxNya0gMPJU5bYSo1FWayO/kilb3VQTAQ5pAWNdW5dEsCJgCHiSYvC3e4zqKiIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bNpv4vB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO9CE1lk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B956606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B956606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNpv4vB/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO9CE1lk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GhvG1565331
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=; b=bNpv4vB/dWXMrFoE
	1p+C6gRNM101/w3jtj6GnxIT7u+4Gu5Lt7e1t9hPbU9KUiqe19wNJs/XHGQE48X6
	+3uH8rGLG8GUZO0PPi+jigHlVPEaelJsvjP4eh/ppOjyeGq+U4zkOxxbs3CT4bPL
	E7CfUYjmHMyZKcdvGRIlJ2od2okC0TgHwvtREl9Rt2SIJe2eF7cSy3CthL8ggHyN
	NYlCKUkpVJwUkfrsndcqKKBcQQvAFw1DLQAvRkif3SSnTQeegzxawmtFsz4//q+J
	0Ej7gdsh8LfKGx5Ut0GI9O8lsop+uwCProDaC/iWa+efdnrXiWd7jl2CGBg20lq0
	107TAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garu7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:51:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94970ad532bso611669885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773098; x=1796377898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
        b=VO9CE1lktVg/83d6hfVPWVwgcnL2tHAKe7aXFktueMRr86VOM9GBbFhDRDR6tDeGDB
         pLZr9zVL0AExKpi0MgWogNBln73CKmtl4Dck4jXCr+27Ge9wqqnob7WFaBd3uuqZ5TPA
         SC6Faj0kpfVAKkB+YSXxD2chK8OQufnNj5QhJEZfuWEfpuqlTjhRkpqHKA3CTjA9E5y2
         VYfxkwDuWWtZ0i7UutQEWnQ0WHqJbCxaYSMmS9OCTtv43gcJgZXiOsddNCdVhjfKU9qq
         0bfFDkwsyixKwZU8LZik6+fHJkv0fWT0Ldsa+v8BM4ROf8VDFI0YQcbuL4ddP5baVDuc
         pF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773098; x=1796377898;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
        b=kDAfYms1PzvwZ7ttWyhEWDR6AWK3GeNdZrpvPExbK8e1QKKFG3sovwwaj8YqE+CuWk
         CjL2Bw7dNbAiXQy4mu5e4WQijhN6JYplmdJtU9yCOEo2Z1uXRr2z/F8AEMzqe99jyNru
         IB3fceBAlXVopEXLl9ixbdmVeiYGGcIbghPuCFSejcUexhNVb1kVaQx3WjUCSA13kZol
         ionMicJvAz5Q6YczpwmfcfeE4IHj/tYjfRjAkj0CMKVt13YOLamKkzF13QElB8Z6+gB7
         LQnvZUo642paL6R6KJClPAtTNRhreAMSLJ3h5ol3Nm0w8feRppdlvDdJp8oLETOeiR36
         ECxw==
X-Gm-Message-State: APuU4Z8htAxKwuNCX5LRr1V2VIc0G2S08DqLrxsi9664kNduM+Se3Z9W
	9Mthum7KeXZDBQ8rAXgcoFioEpjw8CLK9Iq4vutc7QIvUlUnnGZQ6XaJmuswSqLa84Zfjg3FTHV
	sjv6NYqNliXyAjPSIypA/0TQ+zoKjaR1bEeU8gtszkSF3LqNYZo+2VeBUGNSUl1fKPvjFQeKtCW
	i8
X-Gm-Gg: AZFdTZdTcjoZJLwRXXP1Sc77LQ674OiX4+efw4oVjT7S2AN5EToyVoVOHk/XmZjbZ3l
	CQmfCxrn5aUd8/828zpcudyzAkKqi0kfzBiVaUgK2ZrSPuHnI5GPQG+UB5xl98b8Djw+eNI/ss3
	Vk9sWwoNwP+zRkbt06xmHU0UflbWKMZwnkwnqNFL3dKEuyuWyVWwXWnIDtFG3MLkqYz7mKoUlQy
	YfZYDDfEf6WAx+K5FxX51os9qRiOjLLNRnu2DPvsoxOXYlpWoM1+s6JCt0HSR2H8i+yZq81VEOK
	aIn9b9aVrt4pprVLmKAAFPa4JjqqYiWCTpL3WTlkBzePaL0HVGsGb422E2x4rE43D1W4SZf07sA
	NKbu2RHJjYRP48cz6Yqi9aRi8Iz2EPs2PocYs0SPOJDetR4l6xhkCCVzP2LiC6lb5ev08lMsSth
	9JaOe9RtBs3uvwWc3ayroGW32AdQYRlpUYbjVAIl4X56HQkNN55j1vtiesS3tDGQ==
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4402892985a.83.1795773097734;
        Fri, 27 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4402891285a.83.1795773097314;
        Fri, 27 Nov 2026 01:51:37 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm47017200f8f.13.2026.11.27.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:51:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/11] pinctrl: qcom: fix and extend egpio support
Date: Fri, 27 Nov 2026 10:51:34 +0100
Message-ID: <179577307502.23314.4915241215789166549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: poJeccsPXij39-qlqE2fLL3kkjNyRAny
X-Proofpoint-GUID: poJeccsPXij39-qlqE2fLL3kkjNyRAny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfXzzev3BpUQbiq
 wA/8q5yR6FPd2gWwvM3OUEIcYkQiLcuqmoBBqpzOYM055u2VNrcCAqvcIzbI8CzuAyH2FFQPRWk
 SI1zPA5TQDlqgWKsYEPW/7k0K+ZMV3Psti2o14IqKrdVQz3LPTiNlLkwu2ppVO+MqXr5+I3UU1d
 BRroBkH7BdE4vqNJMlL3wNOEtPhHpZ/2pJ42Rzzpd3Er6ayBcNpyqEuWoeyymG1vD+IQ3LVwyUN
 DR8MOI12466Ilro2+cY+tZUBhGrHOa+MfdSAElQ4JjTCtpb88M2RuXli+o8wSXUeDtCNykwQROh
 9OXyWrQdVyD2kKNlR1Mz4GE0kJ1YbJE5CWJmyk9CmJEcbvRPTsoSH+36pj/KS8ea8fQccvW9RvQ
 Rmiy7qtJL3eTOYWJOEMZsiT52pSRVk7NJgDYyim0IDui4uc2xFX7mwEunrdQNiAAPbwCKrCq8sd
 bnX7y43xLTMylM554TA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b0952aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3FmSG_DaQpiI3iZ1DfoA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX3A3XA8bCLVvg
 YI7FozRZ78tSKsyrsHwfTK+l1ttLSL/Wq8O4IX0i7Lx4+rhrBsIIoC9wtRNGssvssj8NegrpbvH
 0EPWyrvffl1NV8NWlcUTMeQV1lVJTZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039


On Thu, 26 Nov 2026 11:21:04 +0100, Bartosz Golaszewski wrote:
> Several Qualcomm TLMM drivers still register egpio as a strict function.
> On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
> series converts them to using MSM_GPIO_PIN_FUNCTION().
> 
> While at it: document egpio in the sm8250 and sm6115 bindings, and add
> the missing egpio function to sm8550 together with its binding.
> 
> [...]

Queueing patches 1-7 for fixes.

[01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/0c77a239ed4f8853901d6627aa479ab52633b760
[02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/2552eac9d68fec18e584858e7b6872721363db93
[03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/44788a3a359a0948405641dd7051a77457f99ef8
[04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/7950d02193d557be6f088a214e6a4a44a7e3a134
[05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/f666ce3884316635cc2f7e371a62ec5167613626
[06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/f0426d6bf6271db4434de160913ca910e2a23f8a
[07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/38d3f870a1cb4eeb4c51a690d51590519de46de2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
