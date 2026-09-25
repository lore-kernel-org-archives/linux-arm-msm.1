Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1023AFD04
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311085; cv=none; b=ebz6WWndDPWRDyVBI/7ft6Uf2eRH5szg6J+q3hpd7Wl50HTP8F1kT3Gm/qxbF3hEhag0hjH5P7twh0+6C6C/T6PIo5p9fRpq8n7yspwSJriU5D1MB8Bh5c1x0AYLddwlmI772+biXCJkf1a9nawrik9fIbz3fZa3zvqFznnDX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311085; c=relaxed/simple;
	bh=Rm+eFKsHzqQH480oOqSih7J/Ux6X2xfrtti/R3C8/Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jTCjc69O9PfgU01BSXy0iSMGbtQZuBb2KsZyJdBXlWINchJEOub6guBm//flLe7nnqjbkPK9NSciLzaJdaadpkGm7wMJerhklSTvozbF5I1jToZ2TPIsIubdHBg582cot/aw1gdjKfY7zVSj6LUReFBCpfdJhkI8IBZABPvLqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBinP6cQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUbFeOJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBinP6cQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUbFeOJo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yg0b507816
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L+QdfKIcld+95910MTqUEY
	7FvSFas88X0wQustiaYac=; b=NBinP6cQWRJOSArbd2wxsXGLdpdu1MnB/mqNIi
	hlkcf0rb7gX1uqb52IwcL6fUFDTZcGy2QNHCfTnQc2kBp0OD94j1aV1YN9R6o+/C
	S6gN61wfcSyyHFixE3CbSD47xUnCBThbtNM8LzGH9PVnCPwVLp4Jchv0Cf5JA4rx
	3gDgyr9Yhuu1ft/QhQR/8ZTrKahj535FQzyFkQQAHLeOjVwTss32wMrO84hmQFOg
	c9KvjGvtWbJe11eol2hoqIgW1rWcc6cmSHJ6ry7smEjMz/A/kWnrk10OMjfqFfMq
	pSJlnSyvhLyfnaR/IZMuE+bGATQ4gdVhooPSN7pz/P8DTUmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjkv81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 04:37:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso760670eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790311078; x=1790915878; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L+QdfKIcld+95910MTqUEY7FvSFas88X0wQustiaYac=;
        b=FUbFeOJoxwQjToxGu1ehza4aAWplQiVIl2wkjI9fgjeGKfW+htF9mfu1P057yIc4TM
         q606+IIdhz8R8fyVyYQQu+VfIBze+UAcu5+jdH3zKjqvOSZ0WEmhEN+PyWkZ2qyC9DbB
         JiRZNrcSzi7ZwLYRojacd0GfK+GqFkZ8ovUtYClsshsLBR1dC4fnNMskPBCYOcJoMo/c
         mxcy2PyV91GcmeT/TAZWzs/IyHhelcD9pdsCVNEjx0ct0hAUzz8/42+Dsv8aMUT4vOw2
         ZYpEZ813sDJGx3ZFzwp0ThVdOTsTCM6s5EDkvjyWU55VXArsOuTogi5767jGXg4BJyqt
         1GPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311078; x=1790915878;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L+QdfKIcld+95910MTqUEY7FvSFas88X0wQustiaYac=;
        b=J08Yo2euy4GItVaX/WGQtMUiBY84JNFjhqQWaJAAMQ3hiPQtrJQMn35JnmcRUUGjzI
         KoBFwT0IFheGbgVPIXxR6xxefLfqVOM8P+LtbSuTmm43Z1iLUMYiqTG9oW2T2dkud7Ps
         uWihFpjDfZHALKtD/80MhFp3KUSoyjEmrxMVMDc2gfbwH0oAgd9sAzhwf41MV95jcM9H
         yAe/7sDPECXHNHissxDO4zkZUA6rxIzvYuXqQV6++LXfVDFDjd6/cgYdZXXR6ojSrBGY
         cFgILec+bWpEO0kblj3N7N0G/CdZ82CgFGlOfD2r4MJLJQAI7wyqu3KwGjaatiLJQrdU
         8mbg==
X-Forwarded-Encrypted: i=1; AKwUvBwseCXZyhZUi5DMWGbIbhNi68XJCsvM/01jZyyYzbI6rRyJdIfZXG5cQL+I/lQXfOIiWpyh44jL04g8VFf6@vger.kernel.org
X-Gm-Message-State: AFuF++mOOHKyZrDu0lR4B/sPW96RKDvm0FeKhxOLP5KiSB+KRa85F9mJ
	NE6nBuuxPH8MuTb7NfxPRC5E5b0a1Ki8AUavEvuIss0WVm69tX0tLNpjfO2mKoV6otfEHUIFJTl
	uQ56623kGOEbq+VQzgwLdty0q4DaPjW6XikutmRQTsncWihM9S0LYgH2BfZiZgy9yMUu9
X-Gm-Gg: AYBFou2aKKKeA7UJyxhXQlt4mcdJeHaRb+bsce+ldVl6oYVCeXmisZ0OhZQm84/ogV8
	21yWf5xfjZ6OAXKV6O334FVF6rnQBRkxcE7sur+kUo0y1XrlDq2XsV/WVMCZySKl+ABwg90g+Cs
	XDBZa0+k9++Pzdc6zuRQlIIPdtf7zJWdUKGdnFP16HlMwU0dP0LxfNLxqnVDpE0pfkpTwPpvYMA
	IgjBF6ORiKe5UVirWev2HVyd8VbLE0twaFD4F1yQTWv7D9g+TyBNEBJnlOCN3CrHzZmnOaytGhT
	8I7bDgDNO0qgZM5sb4Nby3IhHBolK9VOsMxZmOJgOOZme6sBMV6GLNHNJ71uz+n9IcdljPdV9lA
	hqq7uomlTH1stqmYuOtXhPiSvOq2mDlD+Ng==
X-Received: by 2002:a05:7300:c01a:20b0:333:f481:2252 with SMTP id 5a478bee46e88-34001221c93mr3927608eec.34.1790311077540;
        Thu, 24 Sep 2026 21:37:57 -0700 (PDT)
X-Received: by 2002:a05:7300:c01a:20b0:333:f481:2252 with SMTP id 5a478bee46e88-34001221c93mr3927565eec.34.1790311076453;
        Thu, 24 Sep 2026 21:37:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm3053938eec.5.2026.09.24.21.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:37:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:07:43 +0530
Subject: [PATCH] bus: mhi: host: pci_generic: Add DUN channel configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-mhi_dun-v1-1-65bc07ec8a59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJb6tWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3dyMzPiU0jzdxKQkUwOTtFRzC9M0JaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAEhoTIdrAAAA
X-Change-ID: 20260925-mhi_dun-abb504fe785f
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790311073; l=1392;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Rm+eFKsHzqQH480oOqSih7J/Ux6X2xfrtti/R3C8/Yw=;
 b=w0zN+WLCdr5Qo5GVQBWAjdbhwyHAEYTRamkNoE6C6h3k4nqgDL2xqFtAJNbDRQAJceAeVqk6J
 i3QPP3hqFc3AxwjUWgLhfQAh2tex0OH8et81LJuOPC+7jHpIdMiOITF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: ocJc5O8GVOEsPeglzqrxJfwvcIrB4Yej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxOCBTYWx0ZWRfX6IKpVRvbrh1V
 iDdH0yT0zanE9yFOruVelBXkj+1L9K/Byrx6apx8pD64mWsBycNbLN3U8w5XKq80FHmJsUYFSj3
 64iHItO91KkCOpiX5ao0BzE1haLFCwcdXo6szUSM4qI4sKcibHhKLqCYkJjIN1VbRZcCDDNH7mI
 DfYDVGowr+P/1ctXOGTTMC6/dQ7CZthpFzLtNvFCdeHupna2FNINK2gQsGXyhY6s6UTwg87jPwy
 1KgEnMr7Jy+5IjXJDKmRdDsqxDNiu8powvRjRzjDwKpdCOrkqyEBQhHQWiU6Jr3Bh2znxmFvLHN
 d4ta2Ki094cXWrNgZmDu1p1lqpvhD7mBIrLiYdrdJ8S2r8Mfdn/WmbLVLgGPn+xp5RXFZv7hcMN
 DY9TUdf/ByjXwZnJnwvS9vWz+jBFihdfpJgSJN+QIUFXm49q92GyWa1SNXy6qP060l+Y+3l/LoP
 EBfel1jUhO39DDWoEsw==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5faa7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ocJc5O8GVOEsPeglzqrxJfwvcIrB4Yej
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxOCBTYWx0ZWRfXwgsbuOl9/7tl
 vjYehmdoVhQO2bMrA8hslhs+FqMDF2AcE18LFde9GKy9B8pbFgnzZOKGfWXPbBbq7Pzj5s+a2fl
 xGOrLVL4MFMlUW6ThmkxoqURuz8wFZg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250018

Add the DUN uplink (ch32) and downlink (ch33) channel definitions to
the Qualcomm modem MHI channel configuration table.
 
These channels are used for transporting AT commands over MHI.
Defining them allows the MHI core to create the corresponding DUN MHI
devices and enables userspace access to the modem AT interface through
the associated client driver.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..cb4e921d9029 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -322,6 +322,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 64, 2),

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-mhi_dun-abb504fe785f

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

