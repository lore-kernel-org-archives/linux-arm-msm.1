Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F03ACA4D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520946; cv=none; b=UYrk2IZ/RZ9QEfA1JwwYiqSe2Gk/ZEX6EHBJOy/eIDm2k1UPukpanHB+6WIP3K3bMX9/MILXElZtywH9Rx1MsvvkJeI/JazcWbkQku+zEutWoYmHL6PAHdkES/UeF0VMcKeRTr4NkcLWdVOVMahSfxWfuPMdZAL52nuRi7Hi/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520946; c=relaxed/simple;
	bh=T4VuJfMx9MxRf7rLbt01upUu+iKdhsLLEDcpS9X1wrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L43Z7IJfeDwax3Ayak8HAFVLn2DZtwUo0atCZBEPgmtMyoNrMDekSLLfv004MNHF6dzc7joJcZo6J7eS+l4wxSCGP1ZAWqekaYu8gK5VU7pcsNp7b3/u2aST7Wr0mjAuVvcaMIJb2zhERBtaq2COWmnINIMLSmE+2qowqN17Xt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+iIWQwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWpGvQbc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+iIWQwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWpGvQbc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62EJi2962116
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tLSra2wpYTEdApChSyIfbP
	2TyrOLtjRXXKtLYInygb8=; b=B+iIWQwOCl3gqnVrqIpnByCuAfFV5jKOkLBGV4
	ckWVmnEN9ab5jfg9x1XJoX60OS5DnfUs7Un9xS82uWXz/qh/PEIIPovdimzKuArS
	G9dqX5r7OEJsudWw2K1U6yMIX2gVJrBbdpKAFYyllINGupb2/Qy8hmERRptE8Qx8
	X8MT7sucs+aM1BDBYQNdB0S6eGyvPeIu9crrPneVN25ClvRQLRzCaYtU/WAFOOC5
	tiEzb1rMqi5zvtMTBRg7BRpJ5KTl7JpkqZYDrbefN0cGTPtq/dPKzpva9dQ6q4yr
	tJvWvgte0SWKaSfTduwMah+aZaxvULXSW6SW141a5CZX/mXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrgjmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:49:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so10166575ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786520939; x=1787125739; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tLSra2wpYTEdApChSyIfbP2TyrOLtjRXXKtLYInygb8=;
        b=iWpGvQbcng7axdiFCWr3IezgbqCUBuAVe1xKy0adEjr4M1QEVgwVystnxOSXUnvHxB
         GlX5SZn89C91u/0PK9dfeZW8DpZeFjMcKxEL003Fd3wK7ZrOLDViCNfTKZ6hOTniGElT
         Xev0+jp/0eyoOSVL8etS43vnr5wl9fGbC5H5Egrou1Jy18sYg4iAlnVQHLoLoYm4t+Sv
         GYArd6ARJaYp6q4H3LSLdblb3Mr2SyTI9hzvnUhy41Rn6UurcZ6x5aMRSzJKMeiCFhHx
         41HtlFOAqf0a3cFtBwMmz/YLC56I7IensPdbXUAMTae3O64ZvRFL7y76q5+elfCffJWR
         1Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520939; x=1787125739;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tLSra2wpYTEdApChSyIfbP2TyrOLtjRXXKtLYInygb8=;
        b=PmtMXJcKm4O3Lr5VyMAFpXXp4lUw/Gyl8M+dZU6abJiSQgNkvsf9b3Xa5tlw7p4sdJ
         kKDna9M87xkDyk7oV9wZbgC1w+dPZWSNhA2JpgaKbvkB7QuNuW4m2mSGpnzAjiZc13kO
         evjSVFwyBzoNjq1XVPYX9i2OicmJJkSveY6JujENMSWtWQn3VD6zC5G/jdjLSzZFQ8Yj
         wH2D0rSVrf3yq7IE0txhxlJG1Re0MXnUK3fssg+VJjyNMESBmzHYz79dFlYH7v5tFDLh
         BQjjRKklySKSExx2WCdSyVg80wusncLtwsGdMsp+FCMDMG5TLcxL7LzrDVZq0gqHBJKF
         iwbg==
X-Forwarded-Encrypted: i=1; AHgh+RpFmbWTwkdLUGLCV84k/7yRnzo4UZWYZHoXj/4/60uYCDzeJ5Itiab4e5HrbaB+GDLVC9cB+1sugWVGtdVk@vger.kernel.org
X-Gm-Message-State: AOJu0YynDRrjTR0TzoCzTgqHgjuP6oNPtxOw6gP35bXR2JAeN96boPuK
	CiHc5yqy1Q/mC4hcuLXoMwIFB4vp+d33pWz1id2/fzZDSXQQjPass0ZVdQ2jmTbBiI3BfAp43Nl
	iObtaw3HSxeZlpvCUUcBA8Z1aQnSm0ZVnteZI2eYiUJ7dD3Ai6ogFUvupGPrj1FzH8eO0
X-Gm-Gg: AR+sD12WphE1UXtANGWrTix5o4td8eCH9dzxYi0cpCC0TjrTQTQ9b6frryrIfBS20oD
	LqEU5T3WD2cQnrTYl/WTUb8Xmr16b1d4CmBiRz+qTDiUcPpr+4Jf/BcRSZ8yLQzk2C9B078UqSb
	Enipr2r3faYTCdexUxV0P53o9n/czRYmrUD41Oo9uToQAPemVyopRNgsZKBROxvPCcWgh+IoUbi
	Hw5m8WTdjLA0vD8Mrs92JdnkynPoYr6f42uYdZzGSJ6Qycinwbd9YYjAWKlJkYTaJ9quLe/mbWz
	pIdyxXj4tw1mjoG02CP1NPvmo8eahdihmtk4MnG4hV5HFZWuSPmHAhclLq7NIWLVPql6AATxE7p
	HhdU7/lhEWRM79HlIAaZ0yx848hcrrq1ss9/wVecmr38sZhAIJ0+sqVzo
X-Received: by 2002:a17:90b:254a:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-393013f86edmr3419184a91.11.1786520939112;
        Wed, 12 Aug 2026 00:48:59 -0700 (PDT)
X-Received: by 2002:a17:90b:254a:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-393013f86edmr3419136a91.11.1786520938561;
        Wed, 12 Aug 2026 00:48:58 -0700 (PDT)
Received: from hu-tingguoc-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141243819eesm7057741c88.0.2026.08.12.00.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:48:58 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 00:44:47 -0700
Subject: [PATCH] power: supply: qcom_battmgr: fix battery chemistry strncmp
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-fix-qcom-batt-chemistry-strn-v1-1-458545e02641@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG4kfGoC/y2NQQqDMBBFryKz7oBRK8WrFBdJOq1TSKzJWCzi3
 Tutbj48eLy/QqbElKErVkj05sxjVDCnAvxg44OQb8pQlVVbXkyFd15w8mNAZ0XQDxQ4S/qgTsS
 2qRvf1oa8O4MmXonU/+ev/c55dk/y8mseRqJp1l/ZNXA2E+pBYOmKSIvg8W2g37YvAHwxirEAA
 AA=
X-Change-ID: 20260812-fix-qcom-batt-chemistry-strn-6434c631ecb5
To: Sebastian Reichel <sre@kernel.org>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tingguo Cheng <tingguoc@qti.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786520937; l=1600;
 i=tingguo.cheng@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=eDN+VD7WGKURC4qtRBVyk3xkee3IcFWDykNx6qhUbzg=;
 b=TmAuTe8pIsGoVETXya8flEHdBPufgI5iw8qBiZk8MeIRcUJCJfn772tDLbpo/9XHNcBQIwiyU
 HnSKkKqWGoyC1dEAskOhFiTcV/+OyB+yXLJpB8vbt9aNyWaS/tZtaTs
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519;
 pk=T3R0T4olG2WHVswcdTJHHRrxxxuOHDk1nafJK500cms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2MSBTYWx0ZWRfX+2EB11CtzYJk
 rcDnIwwVrWPoiO9JhnzHrB4swbvEyffCPsHV+rKGOLPcQzkN7NB8YO1xJQjEbR5Ccxu2utq8sA1
 GK47yLeunfC+qdpDkt/frfy05NxzvQUQPy8AZKZF9x8BUAfqLTyZNPC5wAHoGwHNH83GEEj70xj
 gYCHUDwWlV7eG2slQSB+gLkqZJQi7Hr9nMnf85J7WziJoTUJPE3+/gf+C5XueoOMslId4uMDgRm
 HVP8jSZSFR1xRxBh24+4/xWd3o76vS4WRvTaZPW1xeswrjbTJq7e6pILr5eKMenZSIHvsGCt/W6
 CpsCAUjRSz3sdDpiUjzLWG5Bbhinq9TZGORKCbojtaXKe41gGade1GJ1CZ+brJZ4YMGu45JObr0
 KQKTuIPZfw1AygS4mlQ8MaSijw6b/d2NvhMSU0yVL9jsUtyGRtqFGT9kXbHn3Nwz/pX9mEVS5E2
 c3qALVl/avnuBEm4lMg==
X-Proofpoint-ORIG-GUID: 7sHasB0f2zSUF2ToDgt-OLXNl7XsqLtW
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c256c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5RUhaqmk56rKhqzsUy0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 7sHasB0f2zSUF2ToDgt-OLXNl7XsqLtW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2MSBTYWx0ZWRfX9AgveWItpXwG
 yRARfC96mFKQT4VFc6GLj6di+ErWeKkGjFSm59znI4AT3ZRSUfDAMAe9Tj6eLt3kfmZYToFfkLN
 rpm8K79ifSM3MBP2PMkz5G5EliKHM0A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120061

From: Tingguo Cheng <tingguoc@qti.qualcomm.com>

The battery_chemistry field is a 4-byte array without guaranteed null
termination. Using BATTMGR_CHEMISTRY_LEN (4) as the strncmp length for
3-character string literals implicitly requires chemistry[3] == '\0',
which may not hold. Use 3 instead to match only the significant bytes.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
 drivers/power/supply/qcom_battmgr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 91cf39b0083a..7716eb9e1aff 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1238,11 +1238,11 @@ static void qcom_battmgr_sc8280xp_strcpy(char *dest, const char *src)
 
 static unsigned int qcom_battmgr_sc8280xp_parse_technology(const char *chemistry)
 {
-	if ((!strncmp(chemistry, "LIO", BATTMGR_CHEMISTRY_LEN)) ||
-	    (!strncmp(chemistry, "OOI", BATTMGR_CHEMISTRY_LEN)))
+	if ((!strncmp(chemistry, "LIO", 3)) ||
+	    (!strncmp(chemistry, "OOI", 3)))
 		return POWER_SUPPLY_TECHNOLOGY_LION;
-	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN) ||
-	    !strncmp(chemistry, "LiP", BATTMGR_CHEMISTRY_LEN))
+	if (!strncmp(chemistry, "LIP", 3) ||
+	    !strncmp(chemistry, "LiP", 3))
 		return POWER_SUPPLY_TECHNOLOGY_LIPO;
 
 	pr_err("Unknown battery technology '%s'\n", chemistry);

---
base-commit: 8ca3d2492e247e36fa9a4350fba2010ea5eec6f6
change-id: 20260812-fix-qcom-batt-chemistry-strn-6434c631ecb5

Best regards,
--  
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

