Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D94E4C23
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409170; cv=none; b=LzoWYKzcqyMlwwL2Ey00ZF5BkBCpgtTb28auHGjmXT/AgzA63zOHMXzyvcfPYsQ4SIRqiNQlJrt/DjHyvwcQcuVu48axM+na+MKU+O8rqNgHsJWjy2bjXCaBNTz2d3V8e72QnAlIoDuSzchTd127FLF0nCJBu9GYXn8z7EpwbWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409170; c=relaxed/simple;
	bh=5j1+5gWDZPo/v74nUWVlDehbVbzgsxlj7niMYz5yZPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAQ5GdZEu1Wi8724HSr2HjtoKjx0MvZhf5RzzO6+kw8G6/zMAwXlibigl0UyHixMpDXYPSFFz4Y7w9IhjZPBGb6fKz8na9B72pu6G3bIjyLgIlMT4oDjOOwrdNAPKaciVP5ROoMs50qbh/zyn5y8gkrF1gtaNPjsEu2HeBHrqco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feU0h8Ze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0wKDdau; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feU0h8Ze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0wKDdau"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orfo1167946
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=; b=feU0h8ZeXYHiiH9X
	eoKb3NhJ76nB1ofJYJQssWZIzNApbA3KKqsXVseIty9J0jFcSv9g57EgVjfIJ80V
	FXF1Hd7oBkvES3EuJ97hzcScQqjy/4+Ujm0vN/RTFWqiAXXNKR+sH5svsvsdYuj/
	V0aEoLQNvg7offPJn2HUFrfukei0vorwjdLg6kpHozhUmvN3y3gxbwz0HoGqTTBV
	JxnVsLZ+XOkaUd9dvnSQ0vEPaWCKPC4tO6XzOoojuGgBmpdPpBt8pHpPFzWh9Rzl
	WqZpNTwPjIp0Glf6uX/xdypLAwGlPgb86GMDl+JtvOF8tLZDnro00oY3qJvpu8hi
	l2Utgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8tg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:25:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so434289485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409155; x=1793013955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=;
        b=F0wKDdaukli5CxYxWGKFUrhtiPSfFQHJgGpTKf40DwO5DijxDT0r76bFi16C+c90TL
         n7KfdDa9KEgIjfPRqkbHnXrLgKGbRrIZRY1h5U7I4U4a+wHelrDBSeIVXouv9gSXfG18
         Kzjb7LabOQtvMxO71r/IXHt5sXNrjQdjmO0xwZZuvjnXqdmDUGnkgdOMl6A8/p+9C7CI
         l/wyQusiTTirbKoWRMmw07XZ7aVubS0FCXQidfQw3QY6Gw+vQ5cL56m9+TSb6dR9FIVT
         /KBL9Gg0wDmtCoUjP/V/vsv8D3Cl0glH+wPFmGyA/ZIlikCB0lATw2os91Vpf8N+x6or
         xonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409155; x=1793013955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=;
        b=Ej6Mx8cqLETEt3+yEh16ylT3xmvkrIN+hWiBsw8FcUqLFPxyWhNlxc90znH71MyaV/
         n6MKeaA1yKcn8f6CH8a4WqzgZNU50cUB2to4RjQwDOYoGprBKbU+SFzMJbiWuC8s71cD
         M7xxKVJLGnLJYLbL+fXL7mBv0vNtCXBI7F47guFVVjVzSDXYDPnuxUydxAmdAQRsa2Mg
         vhwN+kDf6wZz9ljb4kWI4EZiThAJnM5xFdYlXpnlmAdmu2F5jySWVgGh1bfIgxIGjLr0
         PMA2Mjt3J6m9ZZZXC8yIHzqHu81dd+mNiqKIAOrSR3zfE2rlRiHIiRLxo7N/JryRn8kJ
         HxRw==
X-Gm-Message-State: AFq9FYI7I44Ce0ejyFuUGfxDsVdUhKFObu9g4WM+Y6ATGuYw2Z0AnDv1
	ieqo+v/q111IuA4MESa805b4+w5ldAC9yNCzlrsGV+LXFVoJLx7dCkcB9YSOaLUgXfJpp5pubIV
	HJtpg0YvBgxz8YVjTwk1rrh6c4M8hCVX42YYuI+yNuEO3spzpI2Hpv72PG6jiR6EifGze
X-Gm-Gg: AYBFou1/+7sriL+MVlXap9UDE6h8cW1IVhJ9wrZYdlu8LpozJQYsBhkWO41oln+Oxzq
	Nl1vnPSZ9+ZiQpFACw1Z1x1o9ruIL4xs3CvJ9OfRy6nOIAQ289cJ+s3ey/IJEHdFl6MI8NGimfz
	rJHUjvx9kLQfeFgccfXCyGWwrwgSB9sk23MEHHaHl+g53XMCytpliBpZNOFsjFMsm8dPrK+UNPB
	PHOo9UHshO7iYuXZSITH5GE/oYa78E331oXdWeASPuC/8BCTLJojl28vLn7xCAsxDqlQGckGU/E
	pQavfeKSjcf/EAdq6QAGM/UHZnLVMNa97Ul03ViNmn4nP1XQdTy6+tVFhn+VyWYZUBDzzvF/y33
	fkpYtjYQmihZY1NLCiKnyWEp4L4/3iH8/1ZhZ3wl1Ifcz+voSULyB5eLK75ta7nHIGCe1pPATZW
	0/WRtsEK83cOMr
X-Received: by 2002:a05:620a:3181:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f29b65959mr1138657885a.4.1792409155479;
        Mon, 19 Oct 2026 04:25:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f29b65959mr1138653785a.4.1792409154919;
        Mon, 19 Oct 2026 04:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:39 +0300
Subject: [PATCH v2 3/8] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-3-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5j1+5gWDZPo/v74nUWVlDehbVbzgsxlj7niMYz5yZPc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f45YrRHdCDK8bawXDs3JDG84GqSMd55FbwB1
 iURRmnFbeKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OQAKCRCLPIo+Aiko
 1fmSCACAe6SmTmaJZaTQrBt+Dfdyi5ffb1oQGY06s4FGLcr2y3TVD+8a1QPhWLOWpgLyWsvQ1dJ
 jahbLyMnTOxozSmpGz+gew9jTiT4esexYWMS0nC89rt9jGjG1x7x7OCYq7GMERuAU/vAuDCu9Pc
 TuLeJ+iiw1RtveSf+2Ed9fIaDS2lR9Dj7TcZedIQlLMf5mbHvhx3EIQkCLghCmCr5c2wxsjSCLr
 Nsno2PH+h51Q1ID9bhpYT0Bd6I3/XgILhRdD8VV6rNZ6sTFGfpNN3ETS3x1T1ih/1rAW9SNstDF
 UGBPaqAFev1GoAyStjNrsmNmIbfvJHAl5gRMokBuFfe6H8fK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX84XGOUMSZI2a
 NVcZnfP9pqmN6BZJrd/pbnsrNK713zEYarhszaJ5OGbF76AgrmTazafBYknty4UrMzrclLQOZzw
 RldfrdyTbv/nlSJoWTGRUbjttYjw91U=
X-Proofpoint-ORIG-GUID: JYXrzsgE23KEoN4OeOpd63fk7tqnovhC
X-Proofpoint-GUID: JYXrzsgE23KEoN4OeOpd63fk7tqnovhC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXxTv+OWFDFId+
 /UMh3C9hS9bhLfonM6yZMqeCUrlCsHpFn3hDazMKtmMvFmKoKqjW7uvNlpMPU+zze3AWkZzpOxz
 qE49q4O21LqTnDZ5tvYTBhdIY3UMf6wqOXAmRAtvNB2bDuOnrzorE7uiMEWgAQLQIKbpDQz3gtr
 mQ46AG8DYfpZ9ib8FT+QvoR0ycmtXYkU1dpCeQl1i5YLjwSc9/do+MbH6Sx6zg2iOP4z9Lh6K4/
 xu5B9weGWRPX5wOr8WG6aZEkgUCBc7RFx2FR28UCuIEu6QYngTGoxSUSm5SKwRdsLMV0CLKbc5O
 8/Zn3IZOU5iJjpDABPAQ4n+OjXNVWF6BQRsgtOJ5aIjtHNykV7ybJq9dDqwMwrRRr/27lUCKQ5l
 ZysOBTfPmYVSKn9BUG8Ww13EjooHwgg6w8ITG1tlIENFdIXWM+WY1CdrVRyTJrQovRxyXIK1WCO
 +EhL67qL0J9uO9slrEw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5fe44 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Pve-c2K1UEanVU4iL48A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

Allow the LCDB regulator block as a child of the SPMI PMIC node.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..3ca32d741e68 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -191,6 +191,10 @@ patternProperties:
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
 
+  "^regulator@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,pm8150l-lcdb.yaml#
+
   "^rtc@[0-9a-f]+$":
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#

-- 
2.47.3

