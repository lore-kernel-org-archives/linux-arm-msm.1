Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414768;
	b=oBuFOeJ1vqcwOtG2eqJ9oeD0zXXvAeOHbvrtvw+3OWUF0qX2ejrJKGxEDbEu3ufAjy/B
	 Bbmf6VqgtUxO4aTikdLOJ4z0tIrQOng1Voc9QLNuYVx5TtMN3iaE0uEXWjKeK7kaXYLFC
	 I68fhSHfFK704n8BB3ke7TybAeA/mbaTsMrpnK81mqzxYtzJKeRMsMBSDDVkY7B/X1TPB
	 e26/1j3snn9vU8eqNyDse9d17Y/WnI9Ft1JrZZP9HeCp48lsD0MrZY3pd94LeAAnA/Hv+
	 xpK8ak6ZWXs8Ks1zncIGdoouPsjcH9mXtMmB+ubAj56PRkmt1EX6/q3Xv1olYnCb4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=;
	b=AKDH760isfIffdTJvhuT+5Fo0gaOZxgViNfs3YTmfLc8e5CVwlB5ncGAYjRkm/csKGHA
	 38sfpN1ezMT5i9+TmM91u3St0eiH4FaudT+0VKe3tyHN7q07fbYG8on+Sqv4FZ+IyfjKD
	 PoZZmG8nE6gF1hY+1sLoDQmFxduZCrphuZQpLZBw6pjHT+IJLo/Z1UM2OiztYN6s/mmg0
	 S1uVTAFaVTieOLg9sSWPPCHZt0Q8Bva+UMRW/bWbTw+NJBvyJdV9lC3eVIAnqnMTR+AiD
	 PmcU08jVZxCGiroGH72BU3TkPCVhviH1pjf2TVw5FsTn1cWrgVeuHpcRSsdzezxp1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVfJ686G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IJlV/ZQs";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00C606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C00C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVfJ686G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IJlV/ZQs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DYLN1490125
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=; b=NVfJ686GSFZwgzVY
	dMODvF2d5d6zL2DymHveFxSlL6shJnig4tmG+5iVNo8+4aGZxgOAfopoYW9oyP1N
	ESPFkj5uMrKCI0wg9LhjhXNfibNLuuzj18Aj+4kN26/oUf8qxvEe9OIjbdUelYW0
	Hj4SshGexJkJ5rS6fCwtL4qdch/BQMlYOWgV2jqPNNU7y+pXSb5zCH+M0wnGmbYd
	0lpnf1h+g1LovzIeYPwPK9//C969d5K5KvcBk4pLEVNb0BounxebUi/X72ye0fjB
	RSjQsdNPsUiYRsNPj3uO7Y/bHwicjv1fhzCCGpKt3yNu+oolSCpB10dxjW3GinDV
	sMtJmQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k00gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0592d4539so3599298b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 22:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414765; x=1796019565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=;
        b=IJlV/ZQsInja6sMCp+vKajqH2CqaZgy2HnwJkR+e4sOVmvADnIVC0MfF/BsDnHwcjU
         dFf/N8jFrWATq/KujB5i1tf3UPvQupz805F9048pekf82n0kz3b4KLZFvCulHLziRiYI
         +tI1xqinFIMU6uvunqf8sKIAg1rM5AzH+gPdiSj1ArmdIgz7O8PZvODGleIOkf3micsu
         qOiO4KnZ3ao48U8gS0uIZ7VeRXzAalczIAe4i4i25VkF7oxQ2lU7cMQKuK2a0CJcgdtb
         JsSDVJrf7nvAZE1MQ71Ys4FLnDcFwrSCW+AlY7B149k9/jt5MspW7wB1aGygP+GczfJe
         RUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414765; x=1796019565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=;
        b=ldsCZiyvLBftr21TuzJIF8yMAQeZAEOTH+kmi11DWjDB7dR2S+TpbsqVGzoZ4XOw4K
         C8Rns1Ay5CJp2ZS9ePZfbyB2kuP4iR2/JvmXQc/HJ7J5ViS26FUtoLsMpngS29GWMmKo
         oiZZnP6bTGqSP48SpCOj76ynjEuEbYsmBT6PPQ8y6Do7KOL1cAw5+T6U31zit/FQx53H
         Bllb3KuwR2oz+yRnsfrCJ5ayQKw8nsV14qnNKjx5gDGjdK5pQRMK1mUwPOBPqRbkDQAQ
         AW0NHOSzNAllZUStSxJH8prfgWG98G2mi5Atz0dBLwM9BrpuwBKaMO4Jri5+MBvD7mbG
         psww==
X-Forwarded-Encrypted: i=1; AL+hErEBvNCOCiE+RMZ44zeQ8ui7EQcRE+gjoTpoNkZfb3PgWb8NNozOfiTxx4/nbbfaRNGu6mISh8J1384c6fMf@vger.kernel.org
X-Gm-Message-State: APuU4Z+f+gYK3OUIs7YZ0lGwSicQm+cha/3YPqNMRcv6FjS/eWXsEmsr
	+WrBxYv5uIWT62/UQHJQj1HatQ6Uhb//lL6QerRy+9VvMvJh7YceIBQJlIsNvaN+/KLadF9GHNG
	pKugi5YMs5p0VXvNg8nH1xoOPQV7olD0Hjq6HRmr5UYRpOBmkdBFePSVsrYHPpd4PFPq7
X-Gm-Gg: AZFdTZfMUanbahpW5U2P9kn2mOLB4UFG6uBEKr5HGLqD0YmfjtOWdILnKP+5ZnBN4U3
	JEdYwBbXp9MY1lji/fTQIKEoNwiV3WAf/01P24g8yoppeBF7qyHbkh/JiWU9kvKIjSjXd1XjBgl
	7aQzWVlQ1SDkn1YGNSWojo9eMuYhKS/RuA5hVw+k71C5O1UebpP2PF5IGdP8QO55lDA5cc4imCi
	iApXUzIbfM5O4M8FvEfuodF4cGPQS4vxw6HzQi1yRK3K/QSf1YqCqum/MFo7BICCG845v+2Og43
	5WiGA2MDHwCmwxQJuA/gI8NWaILD9cinHrXtHPs+lcU/jgrx6dU6JgIJWlmHQoZERlxmRPbVLyT
	U1IrfkLMZlUQoCywHoQLuFnDzubb1Y7I7LC4JRwZd++J9nj8+SzzVnvVAVlPzpforc2AaGaGF7r
	ztbi/62a3o1A==
X-Received: by 2002:a05:6a00:460e:b0:8b5:7fc8:867a with SMTP id d2e1a72fcca58-8c87ce31324mr9147471b3a.36.1795414765516;
        Sun, 22 Nov 2026 22:19:25 -0800 (PST)
X-Received: by 2002:a05:6a00:460e:b0:8b5:7fc8:867a with SMTP id d2e1a72fcca58-8c87ce31324mr9147441b3a.36.1795414764952;
        Sun, 22 Nov 2026 22:19:24 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:24 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:57 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1519;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=h1TRRDqAF6Cbs2paCuOzlsmc7MRO+Y0BoUrRpV68QoM=;
 b=bQhjtMHD88Cg8NpU1PnpLJrjHPFBhrcspk8vvg3d1TFEkaTPMPRidRE88JaIIM4fbDYiIoKl+
 6ZhCFoGjquNDLVtFyHEBVyd6lAqDNzYM1n2VWP02Rf27iOCFkAtPM9E
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX5ZWQkj0NHD6L
 NjGWAvqyDq1YtO8nJx8o3ZPvOo6xwEnorOWPgHHobRUUkBYp1o7+zSZ/mK9Lr5BJxQ8sdm3mydh
 w0hTbSGXgOoKaqh10Op5JuS0v4CLH0A=
X-Proofpoint-GUID: 23nt746F_XvNwmqcQ2TaH9G2hr53t9Sd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX0mZhUv4p4KND
 co1OK6ewp5I9QccJREauR9bUcz2Q50ESRlyuimsWoPRLzqVfNu2wEOD4Y4MpxmVdxSWqpcpHFMu
 +160VVQWuUxFqmjKmW3iCBnONGjGjj+CuftcF2wTaQtyulJMisiotPDcAlREIR5IwT2uZKWVNO8
 DBqWDcFBCjW7+OFrU/DEBtrqU1eGSzCxrXv5jylFmk70DqEnJigFMGCn4VAyi0BfLhmWg691cVB
 DQZrXjVwfdKlzo8w33Gl+8OcOIfXAtafmtoXmqvMX3FXXpX14MSsg2AHIAWGIzRBzBUE/aWuye1
 YsJD0n07AuZ/hBTWi0o7uColcEEMInTEUvJ3Z/BcOuDGyZbCJFKBC6fRbRd81Ul2ZL2YbpodUqS
 58KtIvu/HDdpuiQYUIlvYRtYeX1a04SL09MELTTEat/uIDUL5P4tpx5uCcodsUAkIXcvNXFAtlV
 4u5UU653LuThnG/yo3g==
X-Proofpoint-ORIG-GUID: 23nt746F_XvNwmqcQ2TaH9G2hr53t9Sd
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b03daee cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ukB5r3Mx2XjEV9IxjioA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts.

When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
and the write-combined mapping takes effect, so such reads can result
in XPU violations. When Linux runs at EL1 under a hypervisor such as
Gunyah, a Device mapping of the region at stage-2 hides the issue, as
the stricter memory type applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index d9f4cbfd2861cdc3d9d48d6b5e7d3b7a3206970b..54499f96e88f4dfc2639ea19a6edd692684eec5c 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1025,6 +1025,9 @@ bimc: interconnect@4480000 {
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
+
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

