Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925F93FCB32
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597827; cv=none; b=aRBt2/w48hVF/xXAU9j3dLxZsFfOftxUhZLw26aZXQ3/fIypnJZcUv69gxXQuUEKPcia4Pl4ABIRsFTJrvhev8u0lZCVFE/mKINLQfMishUoWajENK+lHmv29bWL0HJJVjxUrtxSqxcnc8+IVQDRGc+dF0hd/xhj4BsaVSRWZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597827; c=relaxed/simple;
	bh=xK4j3usEpsKJSd0XWcYMSp0QUpT7VmCcrycPbTzfVlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vuj29fnN78hUUCjPJDp47ALyUOUVtXzmuc+bFEuUM8m/d6v0xD1Io09ltgHetoiO8F9/XuIycK9c93lxzvs5Toh7BEjjEwMq2wl11BYTRDcp5U3gPtTzaoBhtYWZNgSm7EQiYm6cXxh9sSAQgrPgwz43v496YxiP4WoNg4VPgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFtdAsZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIlck5fH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFtdAsZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIlck5fH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDEOs4150509
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuUAmj0mpourRJ08nB6peo+0qeAeM3hok9Bqp0x74mM=; b=eFtdAsZ0aAd9nma3
	SouQatdniBi7RywItBppC0gwkwwuZlFQKhdaK5ah2vEdKXXlPx3L9OOQda4F5nIh
	oFZ3HFl5IAqbZ8u5BwU7XbJOr+vMSCKEWPMofJPK6dZr9c5QIBrgcG0KoHY3ajQo
	4Yj62CtjNa5+Lumn+yAvznDwAmUDhHKx6mm02XeCo2OcR9iI0KxM9/kvzDG9MN2C
	iCKXmCiUhzU1zQXA++F7QuUpdNWQzj5f3KWq3UcuFRqG1tTiHfXJcsyhZQN1M25g
	v60CzhAlYGvc/wSCHpl0w0UrVzBveDoMVcy9tKqiSVeGXqeN2YUwW4E1qNbrHZRM
	OKSWJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff1uxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:37:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3144724a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 18:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784597824; x=1785202624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuUAmj0mpourRJ08nB6peo+0qeAeM3hok9Bqp0x74mM=;
        b=aIlck5fHqIKO6ZDlA+KoRXuXXT1+ulGKUj/rEJsogojNePwsnpf1wXXtDO6Sigr4EA
         aXTiZaLf8MwIAuMOFEfBlVUqxjiH1U8tG4V6jC54ncs0wdoVIU6jbyLOscZkhAND3ZFz
         qT6bdWZf7EWq4z9OgsGiZrKBeiALF3rYDynf4AdXjE+ZVr84bFKgkZuNRPxq2Ju4ZgMG
         IUWcKIgpLrlGjEJALHZIx5f+RNgJ65Ul+kk6Y+uln8nsB92rOBT7SUR/UPfrMu0M8LUv
         5xI8pd5ST8y/NA5rZILpAoWyffj41+3O39d9wJAxI/sgQRGV78rptLxu8EVpuoL/uUV5
         c3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597824; x=1785202624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuUAmj0mpourRJ08nB6peo+0qeAeM3hok9Bqp0x74mM=;
        b=K4n3N/4LkUaq1isLqrIQm4kYHcFevusARlnRYMl26HuwYaC6oYvVrTcJxfjjZVqCD2
         vejeBAYaShpk5NEAn2oAxCbr6GsQi7PvkCi/BtBKBmATsqKB1HrhjZYB2YwZBqUoFJk9
         RJB6zWuI2my6LDcopkalQu/qfs2A/HgmC5OZ6L0Z28yJVfmth7ytBVi9DbOfgd5OzT8/
         /6GAxmo64lGwOzAZft98fKSBxdhEmMUGKpdIUmRqVhQ6P7GKNJEmLts12xOUCDqhHwz4
         V61R+ft3bdx8UNM/FXQG+3hdLtJmyQQKEKj/ADb3ADsLDymODjNWf3FSIuKcdDJ00iWS
         tgfA==
X-Forwarded-Encrypted: i=1; AHgh+RqdizqFdzyeBO2FlJcA2NU85NB+KyUZjiwFbchW9E0ANB3QOGNiq0XiUMklV/1H95rUZ0j5h6dwSCJaYKAh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qrZm/XavhxEbPWWnz513XAiOyZ01bplMClr8FRgh0tQ5mU0t
	Upy3mgEvpyjZUipH65Nfk/oyzaUWopR6xFLOTJJklA4RFy/cPrObCEH+1VD1qTa1T3492Q9mtS0
	gC7X/1MUyLwTVAEZU0/2ZFMahrC3sORA470yp+xhfFZZ0/BZyhIcXwWeqXIF4EMI4vwo2
X-Gm-Gg: AR+sD11Rwv7TexPpo1OxZLfBSfA1QSErf1NEKR787u75cmYoglXA61OnX3klVhZbX9s
	fsPrFMrz+FD5b1L6qZFOdHEf75HXANEJFSMhA1h4ZLT2qXOnvkFZfpx3YyD0On2kC90ytY4Yseo
	4wv2/+Ac1t4iG/MQjPEv5rEIblvzhex0+y+UTjmxY8u92mNU2IHsftcRwTmY7sc/NS/B3qyRUOR
	bXKPTFuLxEK4IOA1Wsoe3i9PiVzXXqOX3tWoAACzkntPXWpnHCEj8wCI2DpNzwEE5xZm1SNnOQV
	EWvqb8IqdftprNnbOk3fI5zADlrqBQuZM0errsteW+NDIqtBzF9HRrfB3PW3H+8Hww4KYh/2c9b
	LRzpxtC1p0e4M/WSVAfWBNfEAcY+9Bvn2Dw==
X-Received: by 2002:a17:90b:3842:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38e3d13129cmr22414037a91.4.1784597824413;
        Mon, 20 Jul 2026 18:37:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3842:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38e3d13129cmr22414011a91.4.1784597823935;
        Mon, 20 Jul 2026 18:37:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm34630487c88.13.2026.07.20.18.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:37:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:06:25 +0530
Subject: [PATCH v2 3/3] media: qcom: iris: add request key frame support
 for ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_ltr_support-v2-3-702842f1f3c2@oss.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784597808; l=1033;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xK4j3usEpsKJSd0XWcYMSp0QUpT7VmCcrycPbTzfVlg=;
 b=P/uiAP9WNi7szZKyaG5sBG6j8VQLx5qgg8eQMB3EX1ahkLIyo96qLh/fIOjKzuOn8k/4myZ0n
 lz/an4JbUigC+DygJOjYNl5VZQFor9Kh8oEMze6TZEN9CEhnssPTjKU
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX/oaDDRe0C/ew
 ezn7tqF1VzVGtNMIdqDylZJu9pnY+4oLvlHWTJJA91WNxETo7o5NSRsXeJcajMlAwCZTMNtB+/4
 EJFDwm0HJ9pQO5c6zsWoV5g25Q9Y6tA=
X-Proofpoint-GUID: qDYqdZNIjyPwXZPgkbXAKPRCrHLLQ7tc
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5ecd41 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kMRPvbZiJaxPZM8SQqgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX1wBMQyxfcN6e
 jxsFrY/YlK+jMN92WTuGg2Da0TYZ+3xRUXfsd2ppJIZO+H4YRl6PuiKVMDdgDULTqTD2YwfutuJ
 CFfa/3S7k3b+q3QBAaL61cZOFsjLHvRgKGPM0OtgcFKVJqJettGQUZJBYPGjQqBHUvDD9iGlJ+W
 ieWYd8KlTZstFzZVP6hH2dzJBH2rRJi3SDbRgCBwiO+4bBXNbZ8opxGcgxRMIWpkFqNgizoxe8J
 fcG3/fuhN+eZ4WWQZTB77gr3EdG3QegjE9E4S4vZ1fHxszaFEIF6bAeFWMZvTBvghs1rkX97v+e
 XM+bV6C/y/A9yCnDZkUzlOmnScwQrx25Wtq8zHdy3AVOejQx/KjgkZDx5WIejGn6e7xVYCS4xhw
 VfiRNZRGhUrxqveIwsFkCQBse57elbhcW8NNlVElCMBrXpgYPqdWTNRvb9frODOMc+4kaY7nCkb
 cK2iflK7fpDANUsDD0A==
X-Proofpoint-ORIG-GUID: qDYqdZNIjyPwXZPgkbXAKPRCrHLLQ7tc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210013

Enable V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME support for the ar50lt gen2
encoder.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3f82c4b7c6f3..39ad3fe2876d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1891,6 +1891,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1

