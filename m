Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559750;
	b=tFPBs5fSkYAw+u4g2b0ZPzFNi3Jae9o5kCSB4EC5ZlevHS94WskcyKQ814YelHUXMDrd
	 CwIK3wHSZl/aCKG+8uNp0705cAuDwJXpQfgxVggWRgDUYroIIqlfv3iyEwwk66sFcXfoz
	 sslPn2peubgbBGUjMhGc7Hm8+ioPILebZiy2m/FR0E3XAXSazlzzHNAje8afhl6ZUG+mM
	 XznO/4tla2WObwgNKKnGHJi9gpHgAcda8GDHOHqy/LAswZky1XC71RdPe7vCg/6vQ4VYX
	 bmOztPwR/KV4vlTd1vCGJtrdWRFFlrLZvPcMso1/2PRJU2eRDR5CX7EXsRg/EI8r1qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=;
	b=CTPYR9sPvJAL0ZGNI7zI5QoLb4uRJCefSBIthLMZeffGwpfKQksEzIRLypKU0q1cyewv
	 HrHX76YE0GPXNnOHBapkrniiwBNH1XZTQWmeLIymDp4Kmh7e3NueqbUDBOLcEuF1ErSBx
	 oYF/8S9ZDK+OzafTxDJfzwDL5k9XK7u2FY5w04Gt+AafEJ6d364zycysPt3ztYgQjHaSf
	 0GeyRnVUbj5wju3zQs96gW5Cq+I+CgxqF2Sxew+2VXZhMb651dM/xkSWpDPGlHJ2VNMdY
	 +Gtn5AR5RgoM3bMs4baana4j2rmLpgx1vgAMX8A5TlbeOibaTxKJuCU4fFF0hgYAw0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG4wpjRe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wwjia4A/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA13606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA13606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG4wpjRe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wwjia4A/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VUmv1527797
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=; b=JG4wpjRede9BqySy
	asWcKN7gnfk4K6M2OIRSzP8giP87ESP9RDWddELjDwu69VBkBZRqGV2l5NYrJUdC
	bTP+PCSdFj7TD9Zen8Y+gc2yUajppwSEjfdkLxiUW4WNDCXGXpJqbyDVudZx0pJT
	CkZe92YogtRbAQAL6us0zP49xMtfry+n3VgtrG67vy/K7GPCvEBvCtslVcEmMFYd
	ZMxwOO+WnLD2L7Fv54ei39/iVUdq8xFWbufh3DLwPpGoMbugUzlvMSf6bRf2MjAC
	yvHENKEgEm4bO8YkyqCchn1TrATSPn7znH49fMVIaIUKzXrqwTU9dtXf7SjGX8Dp
	xzGuKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8gkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:49:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso1715951cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559747; x=1795164547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=;
        b=Wwjia4A/1+tdPeNK5a0W/C5inbsjPpgzEVfhy4uDM6RUnaSuKUKBjApng1LxUZX54J
         qNgzAHQG0POt16S2ItJTTkLf8qggmRL9l1Vwm3XkwvZM4+N0+5A3fYjl/I/7ziW9owF5
         +ZywV7lH1hhcvGSpsWZjdG952Xt1tQRT5/e3hIcul+GnMNPwNTSiW3pxjaY6dR1A7JUX
         ZYOMHRhyafndfwPwwp8hJyfrCuwkdcFvyuVooCz4YYNsDmMHNguqS6xHdfHt1NPxE2ZK
         pf+ZKLmJrpk9H6Ht7SbMFlPUy/JwxYP8sxQ65+7yOPtDmPfvlnyDptnnVP1CP3qF8a1K
         C67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559747; x=1795164547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=;
        b=N+4pCh5veSatmq5ORxDZF+WzZtDKOgZ7Z5bkH6c2StMP5Buq+pL3xgtPOOZIglm0th
         XAZbc+cFfY+kK+NUDLaGiGNSc9USwotQ/bKj5qEDCkLENeU+KseLTYd9LENkqR76SCHY
         S9CLlcWXpzCZHxJkiogsDqOvf6OIs0V6KRyrcDUdj58FqzcWuK+C3Dx7xeFFdcHaC1cC
         H6yVp6/oU+oZRSxinFGlvXjVofdxsSqV66IaLYFj/quLrrgxsFrCgtuta962JMjf+yo+
         fiy+Z3bzwZ0HrOgFHUHOCkCDp5jt7Wg0fbzpOBGJE80mUtCK6a0YeQUyIbYgFMhia9tM
         JYUA==
X-Forwarded-Encrypted: i=1; AL+hErEQEG0D7sJVeP2wsnrDXsc5i7holmwHhhb+4HdLLk7q0teQHhrj2hYcYW6smLFKw87oZkG4AVaR1v9GqJuf@vger.kernel.org
X-Gm-Message-State: APuU4Z9VnDlcw6H5Ya7Iud5PMApZeg/kYY7c6b0aN13a4bj5uzUV0g0S
	+F3NBQWPPx7ckVbPAf3uyQu/FzGNe3GNT6HlEyxf/JNy7f/7LOnxjp8+TYK7f3aTUxNKLlYc8SP
	sbQxpniFB+yvgeumbrSolDhuz10c5gQC4rbYsKf7Cl4RMEtlMA3A8SJzsEyxGn6QFYMWe
X-Gm-Gg: AYBFou1sVr3iZpiM65iyAmcuTjRM0DtZRrMS6lDAaHU0KaBOWJTDiYmChs/ARC3fXBg
	7qewfSYhdkOHlSboa/hi6P0mglQvE57hZ179akoExdJohMqelh2RNsZxjamKFGCo1teRPxgI/3E
	rwvoFqBb0t8rM1kJLEh/X0fi/eipI/idFaCzxZadj9hQj6C9FWKCzvNAdPwOEZXdKhGA6DM2we3
	0bKDsEfJXc4ne5YOyK4QGIl8Ykrlr53edYIf1+muUQlqdyQC8hLUR5AK70F+QRLXc4tmB9twzNn
	7LpDpLj3KpcYRxB8KR55wMlHEeBnjJdDHMeI1aTtulmz7qDJEs1WfKkYKeI50m4NClX4msDcHvA
	s8dpqX+3V6mPkbGG7qSeqV5NnkG7Unc3Mx6GZ4tw5rshColLu80vYHYt5aB762iGUapYwdyA=
X-Received: by 2002:a05:622a:e4da:10b0:54c:2dab:2d38 with SMTP id d75a77b69052e-55ac428a136mr28499461cf.1.1794559747568;
        Fri, 13 Nov 2026 00:49:07 -0800 (PST)
X-Received: by 2002:a05:622a:e4da:10b0:54c:2dab:2d38 with SMTP id d75a77b69052e-55ac428a136mr28499321cf.1.1794559747157;
        Fri, 13 Nov 2026 00:49:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm66912766b.85.2026.11.13.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:49:06 -0800 (PST)
Message-ID: <7da806d7-afdf-4e2c-ac1c-6757e7850025@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:49:04 +0100
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
Subject: Re: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the
 ACPI tables
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-13-ardb+git@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111115303.3749380-13-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXyH74k2JfpvVu
 NHxWos138TnBdqjqpxfsWvbtX7h9k+Qexe2i2x3mOmRLuVFsOai0BUSEPrENsekoO4ic8TmOJHU
 EZ0+obfPw04k/OgYGknWmqAhoZvgGMwSJq4adm0K/iSp4h09M+wPADZw6tQZNbnhk8YKoMMp435
 UUHFflUijPnf/GuQgcg7Q8xxwO6yN+XrQgCLk9vOFYC7g+doDvNkvg2bDRc1NOEwRiYSRY3uLeZ
 UlDwZcV5NqGM48S/Eq2TR12uLQ/BEp4v/sdWiSq/4oVq0fSSNwCtdPvqN5L3DDePfH+y/ShyqON
 qD7/3wwaISXb3sXHGmXsXDAzHpwryeUmgGiczHHVgzpAZLcy9Zw1iFK6eHCab+Dqz/b4mP3UTgN
 /Tj06KKVcpjtu+PK7V+5PF6sFj1agUusWvXz8+M/LUA1VEV1BKwodPxW95H0RxcOPC58GaPxVbS
 kNld5J1CfKCKHGpVXYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXxnNObNRfkDTr
 th1wOeHYL3fU1pL4WuSfdB97xgMTO8WYI9SH9YcJSQ2kEKfmSCCCVoo0w071hN9anS2yQzYuz8q
 oFqFAMH9uDOauFxxlQdRLYRBPAMoJck=
X-Proofpoint-ORIG-GUID: S0KW8-AQKUVld5toAEkq3bSLzT-zezOT
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6cf04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=mx4ymb323s-aB6Ux9hoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: S0KW8-AQKUVld5toAEkq3bSLzT-zezOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

On 11/11/26 12:53 PM, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
> PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
> cluster idle state, as the C630 would occasionally reset with the sdm845
> default. However, the firmware refuses the resulting value of 0x41008244:
> the cluster power domain is never entered, in EL1 or EL2, and the last CPU
> of the cluster keeps retrying instead, including during suspend to idle.
> 
> In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
> besides powering down the cluster, this state also puts the rest of the
> SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
> display is off, e.g., right after locking the screen, makes the C630
> reset.
> 
> The _LPI objects in the C630's DSDT describe the states that Windows uses:
> on top of CPU state C4 (0x40000004), the cluster container has
> L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
> platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
> powers down the cluster and its L3 cache, as the cluster idle state.
> 
> Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
> which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
> It differs from the sdm845 default in bits 11:8, which are 3 rather than
> 2, like in the corresponding states of newer SoCs and of the sc8180x and
> sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
> to keep the runtime governor away from it: suspend to idle always picks
> the deepest state that satisfies the CPU wakeup latency QoS constraint,
> regardless of its residency.

A doc confirms this is specific to "Select Windows [sw releases] only".
Let's move that override to sdm850.dtsi with a comment.

[...]

> +/* L3Cluster.D4 from the ACPI tables: powers down the cluster and its L3 */
>  &cluster_sleep_0 {
> -	arm,psci-suspend-param = <0x41008244>;
> +	arm,psci-suspend-param = <0x41000044>;
>  };

This isn't defined in the Android tree, but to my best understanding
should work just fine there, i.e. we can push it to sdm845.dtsi. I'm
sure someone from the extensive 845 linux phone crowd will give it a
test.

Konrad
