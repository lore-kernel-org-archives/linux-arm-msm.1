Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480580;
	b=SpG4OB0E4h7gGkoaxHvxeAab8vJ33jaI5uhVBtNYyAhH/AM72wV1gTZAipg3DEab40xN
	 hAPcyTmeS6b3DNERkGeFml8VIaB2i8UbcqO1t6aKdy7VFSwiv24lb3S+nWn5+On0Cd45l
	 H87x/T7Ec+xo8hapA4qI9GMR5aeG6l3Quc/7sOwYmt5eHN139scvExhIVP8uXDerxpx1d
	 rDVLc7pgy6d9MFxzLdxAu55NkHhuhrs3000D/Y+7a593MvGwoiA2MfFCtQe7RuhBVswv6
	 QUdvThicVDdDzXl2Vzj9nHMLTGJAnA4dIgmMUbWiQGaCIB6IeKJVRn1fVVbJPNubP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
	b=PjCQbv686h5NH/DLpE7fyTFa5NoHkwFs5ZpPwbvcmQth4WSICdRMTHNk5YbtSaMZA6Kv
	 I6x0un7Xi+iW1qFCNqu9xF+cECf1L6RsnmHDI8V9n1Thiof0LVEXgkp0k7BuIKcS3wbPP
	 9cFEkgnTsGJ/7ydPCCdWsd60Z2QaWr47J+HkVnZHUdLsDqsCcc2A4+QKNahG2rx9u6isN
	 Ehx1yjMK8clnIt05PJUo4AobUJQhQgRD+NvzgoqwyjonhA636npN8K5CoKpGsNsrps1tl
	 3+GOkOnJyhvTa7FN8QFT32pGlq4p6nA3tDIwV2Xk4fLEHZDkHPggmZgpKB3YE0NM61g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0AtttzR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7tEs+M5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E72606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0AtttzR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7tEs+M5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K78mhZ1507441
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=; b=M0AtttzRXOO1ivfx
	P54emTh0eMhl4KmvPdkYFzNqyXijoRTDcUeSu+ngkx8qXmnJ8lct3xywB2NAkQN0
	oBu+obGrXburVFGq6psNnsw5orgmtMMMRkZlU2vCL12somGkZtjr52kLvB0W2kha
	a/WGPetwm/kk4EfpfnRdL0747MqveEigzgFvLp02ZTKdvCOmDVWphrAUSIUTbCD5
	cMN9fPtrmmsDodnrXJlXP+CEAEgxOfVtf+BVRJkUliHevJCpVGxjxUGPD7/GzbY7
	mwy1yNt5pGzpecmUG3w6vFHSACYpdwEYwsglREW3LyGE3y+DkOFZrWxhXUnI93iA
	lBdXAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phcct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:16:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso5426581cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480578; x=1793085378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
        b=R7tEs+M581LwNazc4JENz8ncY4wktrXLRdY18caE9dHTr0AZc671LdEv4cOjgJvPyi
         FbE443yzy7DmGYDoETxQ/ah4o7CzLwVU0J3aCTj7cljjypLUQ9T2Rc7hiycYQx58/UZv
         PyQOAitiKVI0i/qPDMjZJZI2S7L0gyebIOk4GR9+4qve0Exuw+UHlyNAcvbpw01RWfkq
         2/wXQyo8dgM19eauVLBjWF8cy+J0nJcql3OWBDHBlhPGoE6o/8+cobTs/MVoBZySunGg
         RoYpeyTPJl+G1Siw+aBVG53DKQuMQh87ZuqASebKx27//z1MC6Ue53w/XPlmKucMYzWR
         nOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480578; x=1793085378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
        b=A+5Lz5U74nOHkN4idFEobA+YbinYT3W9DaUGGEK6pUdz1hJ1wSa70CYgf5C+QVeezR
         fTfvtXE+gBo1BgCQhVwz+4mPitvG8so1kab6uYEDfmDam3dRk0eN+qsYH1pWyioHGVUp
         my3MuHMbPnSBzFYlFmaSZjiFm88B4ppK8YM0vSuHSGv7WTLuPrgBDQ4/Xfiders0kyes
         n8TEroKLCG9vnTrk6Gu8ogKIX6g6d6xx7GcU41St8I/TqpglBoBJbTJW3w7P2x7P+F9R
         MRkT8cGTnPAMmphmMFHVD0aIhPgkRX6v+L4p3Rv8ZVKkvKK2x+bBSzfAEPxkff6oLdmc
         TsAw==
X-Gm-Message-State: AFq9FYLnuFmV300UyIJD0vH52P7c2q3KG99/D8Ps6k1EC1bh3kUiYrFT
	CAiTFOKIKIRoYY+g7nLiuLHyjJ3Cqs1cnT45WGPpC46ek85t2NkWrPtjfL5W2ZwzK31scIy8X1k
	X88K6FH9UntpWYnSAV4CDRn0Mx4ZQAoF+rjZbYMpoBPMkWmUuKBY08MJ5+VOXFurdUN56
X-Gm-Gg: AYBFou1KfhYQPcsQbKd3E/JDMlOXmh6cME7huHmps2LyE82dFtZKmVJQjFYdFfu3ZxE
	G/ywPWRE5RnhjwaKgztdP9DivARoqUHVJ7OD+dottSWwGmh/SSihCjyIgIMQtNF3pFUpxDQfXMp
	+RmCZs7fP+q0SL3lf7t0UJTcyj9RHc6XTT7hmxl8kQ7pVZOvjsCgsuSyrxlVpHz93EXR3Qa2lq+
	4fyKYvyrmj1lJGrf8nE1A/Ve5W9goXvinyccABvWFHKatBw4CEKWB53SGiBszRBxqqXtOpJY24A
	CXma/AlEaNESlg8v9PMpG9MrbvwL4oiEiF6/cjcwY2MnpXQeppZFBqTE1rQFgEY2xfCYmr85yK0
	oGWz8KI+mBvtoGr3BS00eMA==
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr1515991cf.3.1792480578263;
        Tue, 20 Oct 2026 00:16:18 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr1515851cf.3.1792480577861;
        Tue, 20 Oct 2026 00:16:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb164fsm447640066b.70.2026.10.20.00.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:16:17 -0700 (PDT)
Message-ID: <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:16:15 +0200
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
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad71543 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JzhSTXaIO3PCq1I_VtQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: W94efDok7BMiYHqBiMbT0FO5zQ4LMFxW
X-Proofpoint-GUID: W94efDok7BMiYHqBiMbT0FO5zQ4LMFxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX5N4xPPn/FaFS
 WSvXMnBclxm95X7nQLqNPY6cyAQ6IzCoRu71lelSZ+31e3e5CW3ng6xYfqWalHo4pH+5CAoQU/f
 Bxpt7wjAuoS4GP6PB75I167tXCBg60G/ES69LrcgWzvJeFbOFXsHAL6qZbhU4QdvSx19+h0C8Tk
 qthImgwKKN5p/QHBuI1TC4v1j7teRYnf/Uf7oy/T9wvW5VAsxgPgEqnxbo0ku3+zr62/lSwuITM
 UGp7V3w1S4srhQKrWxoYIfooOhIWUNhhxtlpe9xmvw9mGtWywms8OkIN5N2gdImQMlKsebB4IRP
 vt6glm6Jmh/+Y5TytpFblwthSRIB89oKek1gXNWx7UDqiqDWvRR5qhOQb/7rlF3+hIzuZPZftlP
 /oQsosI0QLcTEu6PN9hj32nXTuIoiH1hzwtMAubG83xFRaGjMhe+zrEyJotZctrvQX3euN8TSXs
 /BZFFYZxcUVoicRf65g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX3EgMPViVCmSt
 bGqHSfOVK9IKG8P+6P7TR9rc6CX26npJzNzwHNIhBIsDHrnc9+1D2WCJf5X7v0EsMm3mGic8Nrb
 kUVqvNiSPLYmPVFmq3lsXaVp3Gcy9iw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> With the NoC providers described but no consumer referencing them, the
> NoC bus clocks stay at their boot rates: nothing votes for DDR or
> config bandwidth, so masters such as MDSS or UFS run on whatever the
> bootloader left behind.
> 
> Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
> PCIe is deliberately left out: MSM8998 has no route from the CPU to the
> PCIe config slave, and requesting one only makes the PCIe driver fail
> to probe.

On upstream, sm8450 is the first one to have one wired up in DT
(intriguing), sdm845 is the first one to have one in the icc driver

Downstream, 8450 and earlier do not have a path defined on the PCIe
node but clearly that relies on lucky ordering

I threw the LLM at msm8998-bus.dtsi and it said:

The only edges into slv_pcie_0 come from three masters:
- mas_bimc_snoc_1 (line 669), reachable only from slv_bimc_snoc_1,
  which is fed by mas_oxili and mas_mnoc_bimc. Neither is reachable from
  the apps master.
- mas_a1noc_snoc (line 679), reachable only from slv_a1noc_snoc, which
  is fed by PCIe, USB3, UFS, and BLSP2 masters.
- mas_a2noc_snoc (line 692), reachable only from slv_a2noc_snoc, which
  is fed by mas_cnoc_a2noc, IPA, SDCC2/4, TSIF, BLSP1, and
  mas_cr_virt_a2noc. The last two come from slv_cnoc_a2noc (fed only by
  mas_qdss_dap) and slv_cr_virt_a2noc (fed only by mas_crypto_c0). Neither
  of those is reachable from the apps master.

But I wonder if it's some sort of an oversight. Can we try to
regenerate the paths internally?

Konrad
