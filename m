Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577150;
	b=p8+Ai6BIhVRI5hf0b4MWQN9CX3jSnQCD/LRjrWs3e23sim3SqnZhqZoSmaQl34PFcqbd
	 czCy+ms8Imx8x1xftPhemClnjSItqQm7ItzPXlEnC3PpulPrc5l7jAoDEU+fZhYh5YIM1
	 7mKE94Ww6Vq9LoyUgXHeIFm7Pe0lqeMh2obFK/EtBWzZheNvYJCrMyvYjMGQZUzekmY+T
	 ReMod2CwpXzB8lUHp/nYKV/2MuKNi7BMmrIdzKSG1qlVLLuwQorIEVYRFMJX2CZVYXxv1
	 /27hwu+xRQvCyRZoHs34IuwWpaDvndRa1GSpbHReCNxZLMdYtQ+TnLUSx1+FOjwK7qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
	b=j0m7+5iJUHrTIMsWLW/J+Tupl0oLnHvM2A53wPTaQpP65nLpjyW3vZDJE+wLTL8LFeFY
	 jcW3jMpm3qObzzx2JQQ1rrudbD0EDJJvITCdIaXPRDs46lmvSnfj2dO0iQVKUjNas1+74
	 CUugW9V5V/3kUM7CZiHC4BdN5NUZaA29YXM8zX3WaJ/nkmW5yQCBYBspTNdIE+CVW1KqC
	 Z4O/b9Y0XtNeIjjMZdsEh6HzVeC58FoHu7girIpm0+m6ip2EJ95GXrAZgeerR3pHuSqGt
	 7BA4rQm8XIPX0OZe2F7XyVGGnQoiKjpJ0cEgxwbwWl5HbxiuOrUs61nMg5PqR3Cm1qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3408606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3408606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BFq01096969
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=; b=disey++dQOdh5OZp
	Oq4VJ08I7p7VCR9MX0DTRk9XRQSwk44yzOTh6QARQlpMtUBZwGovX33z1xOMWntq
	2z6hcTnzKfDJSWpj04ZH6sVVaxg5azsnZ9zhKHw68ZNqA7tA05CD12d7tkU7LLmE
	2kZqo/VwQeOVQ5NBT/9/d/3GCyvq/6tqcGGiNNsysXoOigxY3j3Gp9Wsan6eyDjD
	Pl+aFq0rSXtZ/SXt4+eJ5OPfyTharw5PDY6ndx2cLpJf3nO+u19lxtMF1merU5Hu
	ExhTjwpLG6wmHtMAGWXmE/C3COFWm8JDr2wg5lZ/TLkNsD+M52x5csOt7vyxvQRE
	w9Y1GQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efft6ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b203b0c139so3864106b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577148; x=1796181948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=Hhnj4dgvNbMIK0LAs0Oh/XOACn++U00OD3fEVstyHcQQ/pFytKnhIdIB0o9qJ0eJ2K
         TFGI/oAJuWKjluNraPcIgRQ6WnuUA33BwXK3SHhEzsoblMnfXanVKAq2jJlSEXmPV8gc
         0aUMO2upMPSNuMpl47vXtNvudCupk3dg52TrxNA4h6U//3YmUOEXwFIUmHcK8+GIgnGQ
         JrioF8VPd/+vhOeuLkp/N83dKi9lpNL+PMG5mrS/k6RkRwD7ib4Qy8mHC6nMoZJ9pBb4
         2vBfDob+v+GErh/AUloDL55uXpzKpG6LcCIjUPmoaZ9F+W3s/BCXn2vLrIXnev91U1Ns
         pYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577148; x=1796181948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=TlOkSMoF9LGn3m8X+LgKRu3s9H2QoQpymCSHQhA4xeTedAdSkT6U9BPp7KlV8hcNjy
         jmy9z4i3DYJbJxGdMQTjRygRKSM1h5y37mM3QrzlSkyph2AZsV781xgHZnDeOEQesevj
         p7bhC40+3T06NQG7t4vEIlcvMvN5l3FUt+f3EvNj3I3Huy8dP0U6Hx7JxDhH6Sg3CmCH
         yRJ1OPEOWzb/YgqzYSZ/eeNu17YIP8NXyAYGYkzDWGfINv/kAZk2kmjxMnF0VJIG2yDQ
         bQFpYdw9orBT0sKYQ4llV62UWZxLNAXnFupbI6OC0Hib7tuVmPZnfysjJ7Op0E7Ue4Hy
         obeA==
X-Forwarded-Encrypted: i=1; AL+hErE6USOT39uQ4AyE6j5XnnlHJiBZp9jfGCmBZbVxbitR06Ex6izSE5ltEmDvSM7G2ZWKyBHReaMacHXftOx/@vger.kernel.org
X-Gm-Message-State: APuU4Z9ccwZ4cb5ckBh9q2D44p3dfSvPFVIIVsEFzBCpDhr7sLIP30Oi
	y2TE3JTmQuhvh4PW1JDxjfZkPjKCfdO8Uj+Tt0qCgElhEKjWiyb2w5B6McnIBu7y7tJIFSFPnWj
	M9pfeXvLusB1kgPi6uvuG03SjWh7yDW0q2eTpVTmYQ59Ivm8Wz28sV/+P5fmhV/FHX2cL
X-Gm-Gg: AZFdTZeK7WzR1tc2UzpFUOo+mDiJ0+e2s75v6KltY7dSo3/2V1mLeMZfLJ87Zn7g+61
	dRLnjIcgIgpk4xmPu7sIL8OmxlcJmB8fHRDhpbANImor6q0bs2Ut2fTrFuiFRMisGqF4uN05DPn
	1O25GaEtl999GEf8vRpQSnQJZQ0rdo/bGUS1doCFfEPkzshMPumbywh67kVh2qe5eCUD9g1G1gL
	FcdxZnmK4XG0O1RZE8sICVVBWQgIjvRaRO+cttt+9p9qpcNU7doI7ee4qqhdgfHIJKQT0uTh6Mf
	RAx2SX7zkphZhZiAGzPzZGJ52E0vF9IPDt7bf1ytoEW2ME8nXZX2dllqx4PW94kEcxADaY9GXaT
	s6tDsnX1z9lFnx+jNvx2+b1Pe4Ou6l3yCbkipDGOZvJ2U+xstjvgTsOaZK/SL/19V81A9E1ij7s
	yTpZU9or4=
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051798637.8.1795577147899;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051761637.8.1795577147412;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:16 +0530
Subject: [PATCH v12 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-glymur-v12-9-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=1036;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DbPABSYVkpMlvsV5R4AOmReFgmMQAmLdU68WF9AOk7s=;
 b=1+q+G9l1KysEPxNfsT3JDoeLn4WSzohIQEvczL3tRSUJ2wuxSCNIIFZEg9yJPvbeW6cWOMwZv
 j29tQo5lDfrA+/fxKyUQtotFR9C/tob5keXfp/2MJdJx/iRFs6kiK1i
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b06553d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AZ0k4gBlmfIc1QQ3fuQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXzcG5/j+JEviB
 BDM40+PtxCwhziUlqfh2mmbmlM9renDlhcoLFqTFFjitGxkVCjkAuoyYVl9Xu7xC2s1xRocnZTV
 Fr1wEtbrgm2zQ+Nsj7JwY/uD6WUn8G9+DYCtOph9nPewBv7CX6taEuKKcBwF7Fn7CZrdl/8j/35
 bTH/zXYklxLgR2glFHvPUYsTBQCd68nS2IWy5EBrth3jox4fBDOebuktPb+1DRNooufypnNuaQh
 AATuIOzp7VP3DcgLERfwkL2TUklvy3eCHUDkBAsm1uNItMMIEZEPb4z9Z8OYe5wPIQWPRnM3wtA
 4/Jvn0GBb3EmICyedPa7x+LuwfBc0rwQihuS3N/kkEQLkM9Z6EMcBwd/MhtxNNSG5Aen2EMljjS
 NLgI+D5gNL1nwslZqV2R5AyDByApA0aMV0N4/0AZCNHAIPFOJlOiffcfxcUHQkhkebClLPw9qhs
 d4pLxcTj19DJFZ8NOMA==
X-Proofpoint-GUID: 26Myze4r23-KQln_IzPhs3lPQZjGnPLD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXypl0ANKUYDyv
 45HIpu5OH6Z4piTuQKmZbs6sL2TcdCZ+zQT+HbF8egERNyKK1BjDzQjIRSTrWV7Xw/OjGrqpKhO
 LuOgOi1EcxUosII48IB8F8sKg7hfkv0=
X-Proofpoint-ORIG-GUID: 26Myze4r23-KQln_IzPhs3lPQZjGnPLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..17947e7bd6d5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -521,6 +521,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic45_default>;
 	pinctrl-names = "default";

-- 
2.34.1

