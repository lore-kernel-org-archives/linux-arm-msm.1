Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891203AE198
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369305; cv=none; b=BcGUrWfrGqBj3BheGyPaki48ya0bKwxKcEsrd+HoDa8gsWi5HntfnhfkzdhxBV9jsaAs5PEI2tWsi2p8BcFoW8elufVt+Xwn62J5kjywC1cxaKxwqDSqAgdnkhvsSHUYxl6wXspFt8bchm9mJTkdeABYeUZgBEfRoo9Kwaxi8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369305; c=relaxed/simple;
	bh=w/b734DotcB8eJ+zd/qBpZneLKAt0Ak16IfGEt4XOKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRW/fx6yGByyEk9GaOuKH2y6Li+mxHnzFS93V/Joy6O73PNcefh4hHX/Vzw7ltqG36SHHB9TaNTKkeERSOfvNOmm4EME0cKuiqy8Ky24nNG9sRypCwBzlFTO7/IcIGqCqsw0qF/luaiXrH7vPer6QjcM0lueyfEDROyi9MxLM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckUqmnXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c02dym8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckUqmnXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c02dym8v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5k8WO797835
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=; b=ckUqmnXuoq0xWzrq
	IdXqsBpQ1A7+tFRJ08kfahA7CLTUA+yi9Q8yybHawiAV6hPGrxJjjoLgYyk26Urq
	TSUUsqNPAoO7PaN1d5nEfy7u7Z54964E+a5yN/aUygiUVJ0+Z1djh61tk4LkBKVP
	O+68+RePOv2WMdVFAzMzt9bXXlnEXFRymLUDCrqYFXC8FOjWxfOt59cEVPYK9gnh
	6fDZt9w9OHQgZ99AWsUdFJrfiFT9OAy6AnpWcaoaQX2HNn+8VbzUtMYbCJ+6GT/f
	j0l5Cb08AjGSuuNYXAJ+plpfAoZHG9LexP92JW121XzsYgY9Wc1FgJtD8cJuYJo/
	4KQi5g==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnd3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:43 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46dade0d7cdso2742254fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369303; x=1789974103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=;
        b=c02dym8vmbIymFI4NbmqBIiQQ3vF6oNn0mWH9wvL5KfQ87PkcCcvM40CHxyuE/7HdC
         PYEEKXw2pMTps26kBNPWbgbti5eZ7eyescTBb3anm0vY02Ie/6IhHmwDFf2ScTfkZBpQ
         Ih8tqbPyXoxRy8I0ynaUba9WcZwrpeufA6W1nEkUw/7+POaiXdSoDwKojS11GJM3eHNV
         B+ZbIUNVQOmVvdFKaUvHPMnDFdqMLgmNs0YCF0+Pn2XuGZHMJfcykTniSM7G8Ncwh1s1
         XotCIxVW9nCztmI4OVbwfIdaBqaezNIbce96v83UP2dzhqkFtTyWqDEIc+JbeY7pM1Mo
         LQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369303; x=1789974103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=;
        b=Gp1mZUitFpk3ldE61mQmbPIPf3e5+MgMjVMNYTHeelsJBfhyQDgd3gLXcchEcz6pFN
         10z6tRgbSM+ErPYdgrrDrRIy48SjWmr3isUNEOpPNEL26G1qo7lw38vsaUiaBeI3nOeC
         aK1JiFirbG1zKnTf7UFIbyyCa0cFpTdIG44bIoMu2lR/fZEdmwkaprrEC3I4aVi2TJYG
         ICyoEdGYDp+y/xhauFYX72n1FGFGpbp8jsCm97VCy0NPTxAV4ONszRZ9Dr+wTPungxCT
         yT5zIaxoZdXraVzR77TALt4iZYhWuZ4jguEDxcbTYBN3aIK6g4MGmfC7Jw2211D+bsPq
         rbDQ==
X-Gm-Message-State: AFuF++kgKV+btYmAZJkjnlsaIQluibYwLl0lj2Q8GIaHT/2d5n5YMCh2
	fQllHyfLw+6D+uRDFft1WAli/8NR3xzISIOG5M2FZbhNd0K22SrotD91CNZIOh2yJdT/VkG75B6
	06F6yHdhe/1k74E1TQ1wtJ48pLvgJWPvwDiXVgd90PANY761eUb08LuO4OvAAnuHuDjY4
X-Gm-Gg: AYBFou0GtiPODhAT16UiU1ib7OeXfE4v5kelbm5JLJHnuZy0+YlKhUcgpsdY+9eleHE
	sz0pIshmwTSIVVsxZ+HBpynkvJboj1dyOkrV6KG4V1yTmypsen0j7DwzBstyYtVuNWE5qbbNX9c
	zMMxalryRld8NbEMT7/5XiHytWc9W8m7JAql5Yq8gnsHRCPeh+Pm7dvDacm98EmKgua3yXPS+j2
	GMNnSMFSeeDQ87HUEjee/F4FKFqyG2+iKdXgP6tdvIhfAlIurG/FfPr5pO99nHY1CZAlvJrM78v
	cIYOMtAoweKsWs84QK4yrdb2v9J+JNx4xMuQJ5XW6QZstkC7eJ79IuCJGBYnLRIPew3ceMelaR+
	jZPIOwaAndd0fn5aQDFzSdfIcRr2Y
X-Received: by 2002:a05:6871:2b06:b0:475:e235:905 with SMTP id 586e51a60fabf-481fa35c94bmr645204fac.35.1789369302941;
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
X-Received: by 2002:a05:6871:2b06:b0:475:e235:905 with SMTP id 586e51a60fabf-481fa35c94bmr645167fac.35.1789369302570;
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:55 +0530
Subject: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1489;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=w/b734DotcB8eJ+zd/qBpZneLKAt0Ak16IfGEt4XOKE=;
 b=Z7i1zGwGgXwp547HldAafpO4c8NsnpYQizqQevLpZMjLISWO9vwtBy213CGUp84oeCgWo1B+I
 zy+Osim+KwpDmd6/vgapJvx1UiSw8W2z/ITyY7i54U5EGqWBpGHpRJD
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxyNm/4Id3hWc
 iuqOqxDkWROI66eKWy87LKeyf+UCxRPMGKr4TleAKzabMsd9TtXyQKLH+jb+ltuvjiApxVQ5miF
 M5nHOzfoId2H3S5UFSP//Mzq/BT8Iczx/6n7ba2Zl5hMTsOMloNbKSVruPrKS2SLkjjJXE8zqD+
 6v098qRIGrmBfHVVylZ1PGW76Nvsiq35K/+ayedX+raTi4eyzSCG0LYplZH5WOA8VFDGlvdgKuu
 jDMfAr/rrfR+BPK0bOz94/OUOU0QyA+xx+P2yXcuj+vgurEKiBaK4/iAwubaNEXOrh+bOpNjJfB
 n3iIYSmpmHXovhN717cFxlurDfiPR/FSimCx3yQ/hX+S4q3xWESCRk4n+tBLFqgrmm5Fn8UoT7E
 nDvkKlQBL9x6sozaJcwJJ/DjQbh2C1R3e1tZ6xVjWxl4yp9Ias1sTPU4ffkj26Hn+NAqeiBbmnG
 Nf5PsXrC68WYbr4YB+Q==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79bd7 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=G1H7ZIpW-Owx5wkvfsYA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxtcvozQJUw8G
 6n/cU017ww7BdJU8ph7uWFWWSKQFhAvGxzCNsRYZ4LK6gfJmhVjeBNReSYR/RVPQLRBLvhIUdKB
 CdMraDugA/a7pYTjAucimhSdAHCxzFM=
X-Proofpoint-GUID: StLwBGzLkW7f-ctZwoAzS83E7SwZT1RX
X-Proofpoint-ORIG-GUID: StLwBGzLkW7f-ctZwoAzS83E7SwZT1RX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..89b78e96bf49 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -205,7 +205,7 @@ idle-states {
 
 			cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "standalone-power-collapse";
+				idle-state-name = "cpu-pc";
 				arm,psci-suspend-param = <0x40000002>;
 				entry-latency-us = <130>;
 				exit-latency-us = <150>;
@@ -218,6 +218,7 @@ domain-idle-states {
 
 			cluster_ret: cluster-retention {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-gdhs";
 				arm,psci-suspend-param = <0x41000012>;
 				entry-latency-us = <500>;
 				exit-latency-us = <500>;
@@ -226,6 +227,7 @@ cluster_ret: cluster-retention {
 
 			cluster_pwrdn: cluster-gdhs {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000032>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;

-- 
2.43.0

