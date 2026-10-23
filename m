Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725406;
	b=5tKN38I5R0V/xnE219cbCo8IfuBHPizZHaX9HuczoKsZg4gZ7lG8ryoCFX2YsecxtCZ0
	 bPmg6u8kjsBJkmVaiq6owatNAhL/r48JNCYi0+44q9nTeBqcT+HoOsgFjR9ljd2ghST2L
	 NynAJBbzOXR4HMPUtJwkKTzyOLwPfuOOhxzxQhb5sf0QGuAoklMhl1a2LnZpiQ03Lvf/5
	 kiNYtBZ2uUq8jMCA0tTs5mGBJY3OKpd/M1V0B+8cBvaKM0OIAFM0c3/bLDEpIZvDOGhV3
	 XLk7GLVKW/rRHr6grJSVX77Arhed1eb94f7GosBxQZd+Y9tCCEYyNuayWs292fUWY2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
	b=19kiTi36bwz9jTlr4B0iRDEZcX57O+U77Xseo5WHAAQ390xdj/AoaugvdJv2oMelKxDa
	 S9jkWvYsHJmdZKUpCGzzcVzQvmJPvQs+zz2r4Y6Dbsqax8gSJpeD4FJZ5wigPhec51tU/
	 sg+LsfoMpas2fbqfvZDj5Ck+dx4oiXhkXIZpVowSwL9o2LNk4hW4uLxyr6d4Dz1cRiiLM
	 O+gi/yytDa7K2DhyVTvNhy1MTUAVLWrSk38dAhYmEL2utQ80NWoZIbfJhWbD1x2FUnFmY
	 /SGH84Gjts24JXcYibPhOhLe65PWhZh3+WyTxHWtncLwrfFaT7WVBJrCvUh9VnjBkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWp1UHT2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQKQmI3t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567B7606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWp1UHT2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQKQmI3t
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9ku425693
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xvq0tv9LAvfgk8g4T2nNFc
	bN/IDFtiOTOPum7364YBo=; b=bWp1UHT2MeTe+d70qpBPFP2HUINXGhWOinXciw
	CMJS5VSlicK7ebfvRcQff3QpextvSlyujLeC+vM0RHGiW0wVWjujFmK7g69M2Zr9
	EbasxSeciRuufRK1aCcEMt93pXDPKHSHHVuU+h3XvbG4UyVxWDZz8sC6uNrhRJA9
	7EH81NYVTLmJtKXv8nNjzXRbMzA0i+vKt9F2tuf8WJQ7wyWOi4Rx1KBJko+2CVrO
	vI7yqBCsJVhv6iiPoL6OOuVH1tkTwVGoBZtTtuKmHCgfa5f8QOc0CUfH/WHiJFNq
	fiK4pmn2qRBcFr2uRBLzXN7BpoZma8PqQbBy027QyIQkCd1Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms1kmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:16:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-186c1aae818so1710348c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792725405; x=1793330205; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
        b=eQKQmI3twdXmw+v31npwo7oOTcJmjdSI9qGV7fhllMZyd063m3a23PQQxsMCqyBYhi
         hJu3kt9A0zpU5jp80tn2f65WEzRkvMgQjGC/a29iqVMNShsKyX04shsr3XlhdHo4EotH
         gR2AFzK0F/6C1p0LsPUeaO2dG8+2lHfNZ8zzHqo/v2DLHOrnbEh1mISOR4ac/BTwwCso
         lRt0/BXe35+JFYzeVYUnuqYukg5ey9I7g5t1768BMrbOldDXBeUQjOTtBPdUUtG1y/DM
         CQjL8lAPN0+AbLL/MZQjqUQ3jZwHr0g97LakFzzXydUrSpbracoIT3rtGhr4WnoLLQIy
         W5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725405; x=1793330205;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
        b=Kxn71bk3PmfSc/hAMveh4DbFPcKu637oRztyXer+1XocblNIU0MhaFXzLU1+iuYJW1
         zAIBh/R2WktXYayCEQe++1vvAg+GtijVNdwsDy2k6rl+k8aqIhWD4rHyO5wIiUK0nECE
         s197cD533PIzKETnTBg7VvjKM8k51DVfHI8dC6xTzpB0dSuE3IVC7k5EBs5Aq8QMFufX
         VzyQHx0kHHhK6X6N+i3q+AxrE0dI7DVIeWmBIHKez32aY1YUDVqJLLQl8s0K+mt+mlo2
         mA0ZAhJ6otCdU1MG2Y3G887xAqB2068nMDP7sboOv+DnQ5reBUofpqlXOwJpvdvnEHfU
         lkvw==
X-Forwarded-Encrypted: i=1; AKwUvBzgygLwvkAjDHvizJAVQ8vM2AuJdc0k6k4sPBaHDEhod7oHprWjbNV3aM17V2oHERBBWawL31nBcEv3jagO@vger.kernel.org
X-Gm-Message-State: AFq9FYLVTmbmPxp/nWlWKBhGf25cDBZQ3cmf9AmHjMWOYQsEzB+zRupU
	3CO3nBCEd4YVnQQauTQ2gbbS3IzhUTFseUoHV53RlTetqUEz8nyB+WZDiTumSqWUDJZecPJzbSm
	Llw0T0uimKG2dFWTQFSXe/AcSMzal6MKc5sdjIhbsUjnnkL72d6ws43Zxmf1QV98B7MaY
X-Gm-Gg: AYBFou1oF7eQpsusmFwVIlK5ygKdGtiiGc0hmDIrkbHQ0JSRMX2yOBwKW7/FBB/rhpn
	QgpY5r4ZKD9QmgOdd0tEkIAzXKnet/9mAvjwhG0cp7duOWVuUzLYW2PcqSVlBIi28YoU+yWdQvz
	q+XdH6PYY21WY/oRnfpYFm0WM++CjIcwVClaWokuyQwjRsfuyYIPsxlaENoW0qggFKkH12xszam
	kROnLvYM949Lrz+97a19DRN8pmVAfqjvt2PpRPIn8XE9ByaCeKhg/LLt+0uXVFsEGkNRQUVCppB
	C8h+KMhLmDh1VqBD/dGuuYEvgA7l1Bxn/AzTFoiubuxiA6B7JfcvjcmAr+QeOVRtLraAd2Q6Iz4
	zilPwjv8crTo8djVm3EYm5pE/JSJPBg==
X-Received: by 2002:a05:701b:2517:b0:174:cf1b:235c with SMTP id a92af1059eb24-195c374b393mr1403061c88.43.1792725404808;
        Thu, 22 Oct 2026 20:16:44 -0700 (PDT)
X-Received: by 2002:a05:701b:2517:b0:174:cf1b:235c with SMTP id a92af1059eb24-195c374b393mr1403034c88.43.1792725404193;
        Thu, 22 Oct 2026 20:16:44 -0700 (PDT)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e5163e64sm2374454c88.1.2026.10.22.20.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:16:43 -0700 (PDT)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 08:46:37 +0530
Subject: [PATCH] media: iris: add cyclic intra refresh on AR50LT encoder
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
Message-Id: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJTR2moC/yXMQQ6CQAyF4auQrm3SGUASrkJcQC1aQ4C0QDCEu
 zvq7n2L9x/gYioOdXaAyaau05gQLhnwsx0fgnpPhkjxGijmqKaOrZU0LGkjv3lQRuFY9EUoiao
 K0nc26XX/dZvb3752L+HlG4Pz/AAtJwKbeQAAAA==
X-Change-ID: 20261023-iris-ar50lt-ir-cyclic-ec24f4150077
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792725400; l=1711;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=uh9KbzTFh8CqA6ntGZiEBYDrRo4L39Sm+dHQNG584XI=;
 b=QoR97ve8BBTOSE4yP8AE8ZLF2mcGhVr2FuaKGB4k8WbCteoRH4lLf16mKc+mYUWJzoxrSOggR
 fKN0PGZUQkCDJnnIMd84WzHiObiDqlljpyxhy7KPj6zgl3CGvolpCxS
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfXwJHCGKxp1tBS
 73hMBvfXh8AphoxeL0AmGg4r0PsxzhtgeBWbXTkIWAnu/ZbXoZi5h2Q3DnqtslxHTMEbl2q3o05
 EgjxEcUHqMVi/A5SvDPytsO+m1aCEU4wer3okQfY9nXVOV4bxJ3TvlFKqvkev89rTYQEC1cjW0O
 nObLLos8FQAPURvCa8QOpHuXPEGGLe20FPvzzlBXb/NTiBJ2lOU1w99dD9j+LnSLHBaMgL0gr8U
 UrinfAwljHJcLuuuyjCAPfHuyABAj9tUTeuSj7/mRlRFilLAeSzXuBwwGmMh4L0LZ08n6Ff0nAi
 zW2fBB4Q6Q7EXt/JLngIqQPhWMhvSk8q2lJevVe8WeD4nIJJJTDCtheJ1arVP/YoQ7DVeF0YkA/
 zzoUcjMdG2qzaq7fiWuaSEwBoL/y7paPEbkOb/8lcMQQahl8DZdY/u4i9SPgh/fshCsA05hwl7B
 FD0CKy56tGA2dFON0qg==
X-Proofpoint-GUID: ZpyJtbHkQ0KFxi89WLOSANG2Sm2yyEa9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX3qnBG6O5twEf
 LdARtjECzP2hS++PvPg4gvqkvDBeclA9YEktX1s0YSlprKnEcz4dvKW44xgMuNVauNmcfM+Boii
 1AC5m7p02fgKvxj3KG9t7WZDS4CNIOk=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adad19d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XSycHmPQ-ps1G5V6GkMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: ZpyJtbHkQ0KFxi89WLOSANG2Sm2yyEa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230012

The Gen2 AR50LT encoder capability table advertises only the RANDOM
intra refresh type, so V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE
exposes a single menu entry and userspace cannot select CYCLIC.

Advertise CYCLIC alongside RANDOM in the AR50LT encoder capabilities so
that userspace can choose between the two intra refresh types. RANDOM
remains the default, so existing behaviour is unchanged.

Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..794c36d222d3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -2600,8 +2600,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 	{
 		.cap_id = IR_TYPE,
 		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
-		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
-		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
 		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 	},

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-iris-ar50lt-ir-cyclic-ec24f4150077

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

