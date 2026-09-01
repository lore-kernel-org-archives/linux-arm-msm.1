Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68353370AE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250066; cv=none; b=kt2hg73B4l9a4LEpxJMM4VtWzoqKoV7i9MBwEZWZ5F7LLlHjW8oonFslow4t3RsO1Fx+Z2vx99DhFVPo4HMe9Wck9eT+kQqxSX4u2xYqdX5duVCvqpa/M7NzKq/awQK3O36UnxwwuzSbMQL9nKg5z9C2gmO1uOD2FtC1JidifxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250066; c=relaxed/simple;
	bh=tN441A2j08V3jCDl8xEwrRaH1qOximKOl/mS1BZDvPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HeV+JGurBoBf9iXnb7eSA5qt3Pn6L23l+dm3sSsjGHtlJd2IavaBHqP43f/r1knPDE+Oi8RWAZVSQLWg1Z2U8jArxnoYT9FAs/KDY6xX21wpBZ8KWsct6vFamPxrEuMfu1SnYDxG9iWslX1Ke/5vC96XyyP6ao7M3rXBbnlGSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzO5z3P3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PU3ZPlS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzO5z3P3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PU3ZPlS0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179PKE1282911
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=; b=lzO5z3P3twnyJsy/
	0Zh8c/y33YnHM/BgwuZOSoyoo8gGT9djSixiIWOBVbHH68bSbI/U1gGLl0sMgZg4
	4OYVdygfkxpOUts7x1R967VW36mi3oVn5lChUl93n+MrPikJP4X5u78WXtonQtmK
	x81grYDv3GF7ROSDy9ZLxEqxNvBG9Bg1hemJVoVebEhYgIbExMKxmB4ob3c+RnFl
	ZR7ZmJ2QONPRMvGX2vejCeKywBimcrwvSWERgr1Hy3OuQeZ5v10iBi7p3rNA7tzG
	8iUgSTQX9ZMhAhh7449XJ0RBpUnZNkD9a9z0CUZGHlyqE5s3BIsSFuQLlXnabx1d
	dUs5EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9cgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso620780185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250063; x=1788854863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=;
        b=PU3ZPlS0rAsT9LGey1dD5XwVqpzzJgJ0oZU+0NNXu4Ifj69CIZq9nCw2LxEz1EeYIA
         jNltq0AbE22dQa5Wpu/uQ8XSs74t80hLXvCdFd4uxt9xh593XtWrfRRrcHX8XpiImsX/
         k2h/IGBsRuUNd8ITyXfR3zjktbqUQ07CRNy4dWvV456pXya+8k8a5RCLiZtqliLcvQe1
         bmixl2QkP6w6rJIizcEIxpplmQnHW7bTDgTdkKLI/+6Vhxv0BPOdW3X875rLqxW2STgW
         6B5Ca5eHRSjVLeQZg6wQ+NsTYGRckcu3JYT9SwgWl6xvU+XYXKErRedY9TMa/D5/piV5
         iwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250063; x=1788854863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=;
        b=MSZm+os6JeZ8f6dLHLNSrO/kvPBUgamxH9Xp7pgjmenqq/WVpE8nY7uxLI/TSkYJ1k
         2cZyutG9k3YhrlxG+ctCL2+IQdv/OVFJknad6nywtCtH890X1/8vncMnKHL3IYipry+g
         ahUVoZeteQc/sUovCLrdfpYlB8KtodAExsD+bpDB2qEQWPOdJI+cufbV9hocoJ0u5P2F
         QFddza9p/IFQsDjdoji5J2vj4IK17j+DKb905MiVkyTpgbMqhFjsdn7W6S1GIzyFGe/r
         5DUib9ep7Y/oiDP2KVxGy1Vtj15ZSSiOGuKaoKE0cttdDE9RPe/GFVtkzhuJ1luyPeZ0
         p1Sg==
X-Gm-Message-State: AFuF++nBPHzcGfG9I74GNJ8x3tDkVPfwt7ct8o+trBT085tW3NYckh+n
	Q1M/Y/XT9x6j/E7WoPWRDfcfgcE/bZvEfJUvuUASXu+tqhVD6V1a/4RDGKugCRltOzvUbLJrvU5
	Sgo0WklEAngrEAuaxh5eTfz/eVqprLTX0u9qxyNylIFdTJCePKfB4UgZ5wnUiMxhqc6o0
X-Gm-Gg: AR+sD12Cs7W/kM473RA/mYtQVm3UdhZMlU9yEnQ5JOnXMKqI1cfbavfpGflx2JU9uQJ
	HW2KeocFN6xqUptzAX33KP+OL1bukPDqG50ftCVlESMjL9NQx4DK8bBNpyf30IpngzmHqFmfigN
	jjkbqmoT9n1gpWxK85njVgvp1b7erwYtAVvEXz06A1wDd0vbkMKnZlKC6FOL88EC9jnLo4tlq1T
	jmp4yJVuivYZSGkZWOTr+oRM8nG1xGNivmsuMKQfH5vHsRIb3D/57AvXT6or0kzEsFH/3zAOQYQ
	oIN64/XhqiwUdoH3kVL8zYN91N7AXnw/bpE3RnxzE5nV6ptKtUguZjj4XxCV+o76IoMS5cCp0Qb
	kL/kzCH7R
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1933061185a.19.1788250063065;
        Tue, 01 Sep 2026 01:07:43 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1933007785a.19.1788250057848;
        Tue, 01 Sep 2026 01:07:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:01 +0300
Subject: [PATCH v2 04/16] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-4-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tN441A2j08V3jCDl8xEwrRaH1qOximKOl/mS1BZDvPE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloeuEYxK8/ZCk9O3L4/VcXpkgzptlZdK9G3Qy
 0/HXV6+traJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrgAKCRAbX0TJAJUV
 VmSvEADCkuxwObHMfPPlGdOejFWSmTVLfH/zqt6RBd7ftTveyTubIs3+n0aroxI53OQlVlQ//Ek
 jcSry3E5WaT+f6f94eYKdK5QxODe4W9zhO+4twWcWrZzSMwPPAvaP05SXcil5m3HF8J+nlq+B5j
 FJAf7GGVJ6kICyEm5BCP/hqU8MT7UTHk8eJodl7v6Rl9NPhbrQ39Kq/bmz2evocQ8XSRR5W9t9N
 X5ljk/Q3ZxRtzS7lkBMZOUMu5G4LSJjpFbtGH7PqF9FYs/ZCtT34Icxak2YJDPlS5npsaxmbVt4
 TJuizfUhaJj+192lTdweOizlZu2jLf24x1rg4mE/CNJIMbt7JpWRJSpo9uzVdIxG6KQFmuO9yE2
 JQ0qo6TLWgiHXOT9PIRdycQJyPn3AajgLH3BrxxczTsBrs7Fbz+YeJA45qSH6oQpjxESvnt87l/
 ZkBgrZ+9TQZYMC1pfxXS/XuLR8TZetTrrAwOpnZoEka2DG0aXDJB0pCKcsB8qXIoAHBB371dOD2
 m2ZAnATDZEoMZXwpTBCMhBcmjdUmjmHCDbHdh/TAVI79wZFxdUelaEH9KQvcd0G2sOj4bCyfjT2
 FkyjQuILJFA0rru5qg1OFtodRWx0mbhqCkzO0Ue4h86zGiT5pg0ybTEo4C7tancW18j9vcxCqrx
 nanF+AxEnyfONVw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: UpCzCBH1SMLnIXfpXoR6VQiM8B8RR9dJ
X-Proofpoint-ORIG-GUID: UpCzCBH1SMLnIXfpXoR6VQiM8B8RR9dJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX2YIexXDMGfRO
 gdMDdFHz6lMcUF0nOTQ6A1YMoU8JL18b6C+pQQj2bS7WSfpryHu1mHWUNme74d37GarPUwZlhDb
 XnSx+3zKZO21fNBeLMqHDhZWnwrRJHE=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9687cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7HNKDRilWcY5
 +bkwMwxbw25z4a002VoATuDAlr4nzXt+Nn3YPs5RM09ufqzJplXFES4JLEoO9Lkg4bkPbwO7u6v
 pXpTQt43LwcjpODfEhIA966TrVtwNeK7OAp1ybM8VFj5qESCJp7dR6ITKLAScY9EzR5OnnqjEbM
 RcSKQjLGyrcLD1xi2Zj25v5j2iA30aqhTdXg6RM+rQiZOoOKkGGroHGvQb29LgeN8cFV/9o1/De
 o3kw97IZvtDbbr9Dj6Fl1mYokE5t1Xbm0p8Yc7f+bRcVWjyhsC7zCq4YA5XMcJs5w6Ik81x9X+I
 3gQcYrRrVvNG99gOEJ33IVanZV5M4xXAKL7QVvCltYc7J1p+AN6NVFhBBl9a7tHtYRuswbO9GPR
 OMTdgA9z22MYBszwHqqU2Yx0CyRRmLm1dl2nIBaAGmXOY1xmdDDolRLz/1zxwIemasd0locsSeK
 D7bgiiBQNXX68vwM8SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 2be5a37c00cc..b795b65d604e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

