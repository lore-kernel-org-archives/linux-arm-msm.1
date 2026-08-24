Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA4415F24
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572530; cv=none; b=g/AluVCQ1LuKOrGs9o7W7m4eYzrB5EbrxIM+O+GumzZCXR7Fn7w7UyDSRu9Mq8O95k5xCAFFk+kadTAFVv1Tp9gPEyAjrn5lWGeYpC6sr5VXiI3PJj1Ni2q2y7Y8L2/acILg9MYmirJDOaBI8j/NmMhf0GfEDavlWPshvf3YUIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572530; c=relaxed/simple;
	bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0J1tz7EGpfjHFEiW4f90/TB8crV0FF13nt5dBEXMO3E7ffh6KiJlmAULVH/bdh0oHmKrHkmH94CZxZ24649240DPg5dHTnxMUlmY44XTnFkdMJ1l/lhlX2GFoF/SwgFcZdlylslHnEszLcPAfU2GQpUsUbYQ6e3nX0GDrCflGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsmSuJQx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Drm2GYWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsmSuJQx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Drm2GYWX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMU9R2647975
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=; b=fsmSuJQxa4KgtsVY
	xqfWxGzqKnvkGaEH0cL6aqf5h0TKXDRaPx2X9AqBbjz4P2n8MB58lCGe3uJrfClS
	eqJEweH5/5m/98SuHA+cbKvP8h+BRyeUHBhEo7+JikpHHqzliibM+EesRJ2qYGL+
	Wn4bAFay/3cLAmVPL3pKLCND+eQhKq3hq247icJkpusJAvrrhJhd9Cg6sE3KDeeY
	HJ2G68K2gYyScQg6x26//3CSironsYGw8SJjUuMAiAmBuTzwVHVuBoQxeHA+azIJ
	1mrogeZCLKWPGit5U4862KJElHyNlCK7zL/R+8E6HHt+ybsyNx22hOdoXSd8EYXH
	cp581w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9aba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d33c89a29so45618751cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572527; x=1788177327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=Drm2GYWXKeoCLyCyn0HR+Npd8T5ocgQSAVSzHdyNgRKjLaXWlszksTcSry9S4f/Q2M
         5e0B1EgDOmKQRklV5aLgRnzoOs4MSc0pGR3lRKO7pwxvlk+psLouSrFhMVENQkJellIU
         dzhpf5ySy9EMVfHZgKuBKKPDjNJbvnzMidnCinGEc+Kz/N1Kq8CK7tSXKOxr9pyTQ/Wn
         U6zeHhz64zPCyc06snEmjGRYMlLNn4vlNiRTL38Xt9gS+fxW9w2BYs2blI8GmTCWmBUr
         90u5o4G+CmgyLkqNG+BE2HO41WfgB7G/2PMjCgV3t5ulWvVfXZjTO7eFrQusEIk/tMiA
         rN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572527; x=1788177327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=CV7+yCPi33Q0GLhPlF+WLuJUkuBRMEoY3ZZG7SqcEyqk15/nxVB3HnVwpxotJRlp9E
         ByYD74CxTSdw3zCEAgX2ygLSYne6NwEv0eNqEw/Eafe8XLrE0vYqeXPeC9YXlFY4DS8N
         XPdZjOSsuYUzJIkWt6jmiOa86SJm45YVbpB/wuqNWzqyGwccf48QKKOJruiI3nzt18/H
         fYnAggF10q3+VreFrQxrdqHpCO4fJ+A0x7raBNA4JZzZ1z0WfMXW7o9Iq66jSUlU2CmQ
         xOKjcjjNj1zFHMC0I1XUnQxBfEyHstMWC+N1j13vM9G8Xf38hRkZdmKJFsiDqKfAmYLw
         E9hg==
X-Gm-Message-State: AFuF++m/oGQIiW9ArHjXuvOxcFfFaTsvQLAj6VsYKa9yhP1IvLfO2uyF
	H973GcpgMhsqWrZc6FZbE0487Mo16fxo1/udE87UOZWK40QJw6yhNbgG7K7Ybzw2vo1CWBrSCgO
	VJXf4/RnINcsPohDVW16DHWNkQqoC+uVSNEf/iasuDqxWaPUlb71hzXnyJa4o5VhOluyu
X-Gm-Gg: AR+sD13qrFq3VciaUxiAVH3c/VFTxJFaYYZUcUS2WCrdWoD0kJN9cVs58LbCLdI72Jg
	fO7H27uINW/roB3gsX2DwjIy0MvVWJLKzylwU0+W/6taT6p6VsjrHjPPF+ztsfVJVFSyQ34MADE
	AC0XoSwBuZnwunAWacsG+HWNwP5d/VQ/zCUk8rRANyakAyZms5qw9xNna7LEqpArdZn7/70B5KB
	nN1yw090UB7VlE1FDx42kGbPCp9STzf3H9UTNBJ80ZglITNrCUP5OrFhkxhzZaIrQO3w20aY+T4
	nros9isHoYMZSaBbjQJDQD8dqU8KviqMdxy9VbvozacdkhPsZ8FGYo1VMcXbgRwxVIdLF4bIZ0f
	nh4EzaBSF
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr282719521cf.33.1787572526867;
        Mon, 24 Aug 2026 04:55:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr282718701cf.33.1787572526275;
        Mon, 24 Aug 2026 04:55:26 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:01 +0300
Subject: [PATCH v3 14/47] clk: qcom: gcc-qdu1000: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-14-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDjbwNCa9vAm9uHMGq8HoD55dfoMDpZTayPg
 +qe6rkLyY+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4wAKCRAbX0TJAJUV
 VjssEAC4kLUp6SncHvRElvZuLBD070xtGyWjT3RdwpTj6vsDxAw//xJOcUsKP0P8YHqJ8mvarAJ
 WaIyVLNLkPCXBXZfudz/fK73++2XEwcJRdMwJoCPBKGlyGIGSbT+zgm8Z2Fflt8goFXpVqEGvz1
 8eXbefNVoxIGE25aegwuPL08jMpb1YXP6waPNEv3dFGP1GNlJ3PAzhSwbmeT1NKVyPl2S4YbJvu
 fs2nCiC8lBw34FoF9OfwGTGQb52x+aVW4tgEBzxHUjZesxJiVJXrP2Gn9wYK2kYjpPRqDdSVUjb
 pJgLG0Sw54v+8yWWs9Kjrqv8stLzIgUJ5qe97Fr2yb0n6wuElbwO6AtMVW3GK6JOLhX+p7Gl7yH
 WMUECluqr+CQhCmQTfREqtbcRuRxDDRA3vVaVNmH7QSybswYdSquDrfyY5wQoEiY7TOsXwTtBf2
 il3TjMJeHDjth4WcV0+Zb2j6VifzHFbuxeq4dYzpGf8yfFNP/L9AVbc2eE8+uFNhCANcYYEKfAd
 UBjf02YrnZuK8JHCh/9qkE2LwhZ2w/iUgnMBnA+3dqG4AC9NuRm4h47OAKrel90QCjozwNXFiK2
 6GVHIQYn89wqfkhQQ7rf7s0L0c3FBiXtGbNWzp8oQDouTIgjaYfYM2cn75gHUp+9bjA5aLRaPBl
 5XE7y8AZMVT5UKA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxHUsA4G86Fsj
 +2K0t3P1ly2az1eQopYqXC7PavUx5K/bh70w7hDQr2dL+vk8GEXo9IdiOXN0I33C2M2mm5J0df7
 10n9pG0QsZc85P5MXsyRn6ZGqS27FVI=
X-Proofpoint-GUID: HmaXCq7u48YkD72TT-FYeiI20tJHsPqR
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c312f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9n1mfdhvwsDQ
 ha6oeSzmaYz54NczJi7KIVty1ujI/hZPP/y4q59xfpCsCINMQiFoXN/u2y4WmzUJc9OUxKqytm2
 DY1LeJBki9n/tbJK7u/4N4KqD4HE7d5a/FSxWKyr7bLfLFCvy0SUl207/P2APBvPbNB74PMX0cl
 pENnBsW0JiWMeSlNB3Ff3e6Auhh2jG1/CFtkbZhFcRWKVRvcUMMqNLALQ2U4t0kc1leo31sMadd
 BgcHIHI2LaGnZoofQd95RnGOv8kBWiluFA3p3jWiMwRsc6RuiejgmjmQ3BOnr0Dqgmfgu02aXkI
 6Iukx2BHwWi5pULXS1M3FH+4SM42kczk2j/e26dnblPP1LMwm43hb1wxsGM+LRjptMd2EA0rK8c
 CH4eo5NzPr58qJ1+jiDrTZef6yVk6L8XX2IQEn5NEE8Lx+5Q1QEQ7UaqlbxuSrPotZhNCH9h1FC
 0K+Y6MmOh1JTch7s9nA==
X-Proofpoint-ORIG-GUID: HmaXCq7u48YkD72TT-FYeiI20tJHsPqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..172303ac4c9b 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2649,6 +2649,7 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
 	.gdscs = gcc_qdu1000_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qdu1000_match_table[] = {

-- 
2.54.0

