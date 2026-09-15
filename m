Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1247ECC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464510; cv=none; b=bHzO3K6dP3Z6H8ofZy1k+KNlrl8v/RVz8/Qsk/7M6PhVIa8nUwo+5MFNg7GqXDRIX1x8ZzfACWb9Y9fS2662cLznU07orqZIBHgj8zgmTVttoCZ90Xrx5/RZ/YsRlWhZ7wzDbV/xWOXzJvUN44OJuJMrCgBC+2B7OJOaj4fWXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464510; c=relaxed/simple;
	bh=bXRmq/LkVHl3Wkzce7EKsFKSt2ADGnLeNMNslKPB/Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psDhsS3iBPL1BLWsVafnczurlmxJMFAcEXY76Ubr+0uXjPf3KMIDIpD2GGD0C4pcz2xBnKOLg30eWZdYDCJzHxjPABXKZQnEJMVcMYsYiHz93fJj2CQcDuUVqJn5vxhXVoz4XJZYHHsRS0Z6t03XDueN0ABl054pTpAtxXVuBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsL1ASB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijXPlcx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsL1ASB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijXPlcx5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZTPv3316539
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=; b=TsL1ASB1A+lZ/1eT
	LBJ9E2E8PCnI6ZHCD0cHP2aJRS13h7sw/uNwbdc1f/1wdebirFjchywIGCeFXLsf
	mIReachwmLdmCl4xj3Lf0iZXOk6zV8xvgEUi22eZGWj0half/PFs0+3v8m+wTd+y
	g16L1O1WbSioFZRS11P6rOT8i9i9aZcBk39wIqbt+y33wD9AUIGXr20/Swa4pB/3
	4On/NZaNuVDcN8DkmqQkNs9ACsrvirdrGPiO8PF/Dh6UY2K8LkYuRi7GHVnm4DP5
	AkouD21x/wcssxd+w+0gFo1YoBgUm2yLzxFNoHP+6BTTlYfzCPsD8iWV2/b4Ciz5
	sw8+UQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux0yr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:28:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso325472785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464504; x=1790069304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=;
        b=ijXPlcx5otuTB4poGEZzzeG6rqAmUX3afxX/K9gF/GvMA20g5ltST0lUlNxzlKg+5a
         LtJXguxnBLIyTts3qHlf17pjDxz87EUC4n0On/HhqJNA7TlF/N+BDzndTuxwnXoNId75
         IFeCLVXCk5bVxsiEhLZamTN5fJslx7ZUW2R54Tuzxzj01ja8Mhrjp3DfvBMNLojey9Yr
         gAVa1HnAvObWg5EJYP8A3nAADdnrEmsEjdulJ8BNPbS4E4DyvX7eoH3tw8khPxby5/pi
         ehqysBw1JVWgJMSEKu82ypds2NnbDCyEFKZGqm15njhJOfldB93c7BpZd8pOSzKCohUb
         3u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464504; x=1790069304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=;
        b=saoKONuH+cJjLagAvW1nqHrFd6yv4uJ6xp5RITG/AOTPFhsWFYQ0itNZwqc30ZHlmp
         yhllhbb3aGCtih8wmC/KOyujlbftIPEv9oJDVRI/IXJJ3I3xKKtvyxR5ta8Vi5l1unit
         V+iP5lt1QDNeEdV2r2tl6JECrY/ZQN5rE9X0TNZ0gSFkmU9SlUIwWOe9agoCtxesrHXE
         iIhKk0qsDJ3BabPLk/YF6ds5kgOTjOyV4Jn+A59yi+S24tq2EFvVEJkpAlAMY/9w2AZa
         Z6um408FiIDY9VcrnhiX41hU5mwNL0CRNZmAAuMvyfLOsTaNxB5zv24iCmDoDYl/IzbL
         dWPA==
X-Gm-Message-State: AFuF++l69xiRQo9i/f+G5lYeVJEIouxtSouS3RmIlyszv2+9Xslaxq7Q
	exJWqepwJbAuQcsOpMeD3Z4Hgd0GSEmhfrM/EV8pSC/7kc06oHp8NGQYfm/WXjayrDOKvgIlAI5
	kff7A7Q3yfJLIlsF/jzEm0rKtOaW60IDvSfnBNxil4JMqvdcEgi7FiJP9ZCtOMj9BtwAf
X-Gm-Gg: AYBFou0CzAH2T+3t4siDuHjUBi8JsU/3mS46thNVPmC3HBgt3GSM4TebeyGMhoHhdel
	CmXdDu2aUBB+DKBkRELiTZ2OYmk14jtfaOGLeBPyvTaAx5Ye9LRDl+ybjwWgPl9kvwzas1w2ZjH
	BNrA7TidyFyCwOuo6QW5PeTkY6ArHiUn4Djl/q54V7tANOprpPoE/zCO7IQaiXXqlZsi6INF8lu
	OFUdc0M7JJtudlVQsqHF1ySmMurpl0EOHdYKcHCEaJ8KYy698dWltT9SpzM9LpVw0ubMkmGB7Q1
	iqaaj/GhUKVapIsZ4CfRl69xMaNm7uXIZjb+39rCJVXFDnQUOeH+QGg5HngbQ3UB6EWDt8aBRGE
	Hsdj4R5uFFNigcEet7XB12H/QxzQQiGuzgMJTq6N4xj3lEepjClRWIsPemfdEavs=
X-Received: by 2002:a05:620a:4808:b0:93a:12eb:b632 with SMTP id af79cd13be357-93a297e5c8dmr961288885a.10.1789464504614;
        Tue, 15 Sep 2026 02:28:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:93a:12eb:b632 with SMTP id af79cd13be357-93a297e5c8dmr961284685a.10.1789464504190;
        Tue, 15 Sep 2026 02:28:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a3f467566sm18939785a.39.2026.09.15.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:28:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:27:50 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464471; l=1099;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bXRmq/LkVHl3Wkzce7EKsFKSt2ADGnLeNMNslKPB/Js=;
 b=pXi5y4Y0Fm69ZEAcS81pYwIUOtYfvuA2eymuS8KiMJtlmzTHrX7GfKEKbi1NipcnkJiNQqRSw
 vSSUuKpKEFVCyy2NKvGiSs7QgaYWpj+xZScpuo6dRvIffTF/9r+cMi7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX5QkHQTNfs5Go
 LAzFozcFZzkcE+nKHcPl+h1Pg/RlX1hSvadijA8X4l49g3ulJNIBex1kQgZdFY49Z4Gpynro52M
 E5gcXwcVU6OV3UxnfXUkAjmfvoXDaGwjAkZN9cGNNUSYCjXRqIvcY3LgRBhRd15SAn0xCGnwwTP
 oFpAyuEcoSb3fwdT2d7ymtb3xx2bryFxqiF9vvTu97Mfe2a90KnA/ifuSFy5CiWJouAaxHW/kpM
 j7NGjlC5MAbT/u80wy4npjJ7+CajTrxNTVc4wiKo9ASc062sVxkCtwNP3dLYBV7SWM831m4+euq
 OXYywQMZ7qOelDWAOwr2VfcHxJhjMUj/+61S9PdHpcgaWV525qKcOYUbHNznHQtCrICGBUROXxd
 efVfGwTbjmT/2W7n8kClUhL8nq77JJImDlRBp6qViP2dtAjdoPvSH3LC8+Z1hmrtofkI25awkpj
 5/hj39fzjkSSusjWy2Q==
X-Proofpoint-ORIG-GUID: sGWZYcbH4Cgwk5YT6bkjK9_Wfuxorzwa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX6nHeYm3g+mML
 qEmBgs/Y6aUdHFVKPVY5483jTfxX9aFaTvdMrEe5uMe22LqQMeZDU5GOmXodmd605gPLRfjuanr
 7HJ0W3m/pJuucLUz7c8qkvaXQ2dkteo=
X-Proofpoint-GUID: sGWZYcbH4Cgwk5YT6bkjK9_Wfuxorzwa
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa90fb9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aCRQ4ZZDzeq032jGe_cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150135

The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
the display-controller (DPU) node, alongside the existing MMCX
performance-state power domain.

The MDSS node's CORE_GDSC is unaffected, since it continues to power
the rest of the MDSS hardware on its own.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ace19b8b12d7..b3e3cd1d311c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "mmcx", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

