Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341983;
	b=PxnDx+xSM6OAFMc5/tv3byjIYkFRPRvkJSnpMwYFG0HTY4pzpTFFqhbjZonBNdvfqsMJ
	 pdryVOk/fgRgqrTFULpSWbaWMDXStuikuMvF5FeyhOUS+R5yXU0fWiBFQBRNPhpHh52x9
	 i5VV0kwvCUS/AXEDhtyosRA9zlYQlHXTZ7PGDEztSwIJCcLVhw18IwfJyzj5oo8QB95mi
	 oYo+ISpJ2ty6QsltEHOTmIJewKgFWbTDdA8694s8fRD5G/Yrv+OMeY/FAAw5R3B1ytX5+
	 OElRlfmcROJtWtEzTuo6oajFoUXqNF2AJfy2JNDfMLwSpzM55duVUackaqezTcN+0jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
	b=5NGd0NXIw/T0dzR0RsMQBn77l/jEaPATSMQUpCfZCi5zvgdyXKs3yOSHdIfxkBrIn5/H
	 vpAHJJGAnNS0I4/WSTwKToDL/Tkb78VMw2FvacyuSGyJgE0CmNQz/QTQCgb04hpY7VWUa
	 emfuCOYqvgBD/pZ3nWuERvaifMwlAuOcRP/bbkhr1z0PbJxftAxdqBMt4F+tQc7qaed7e
	 n6om4/wCNEMF+/GX8ZYUWfwK9UwZS2FZwdIX9KjW73WpoicZeBvV/+YrLDgffJ1vtyfmG
	 OiVeb3yA+r5Hj5SdlGE+3HjRm5U3D/Ci6xlyqDW0D22TzG9aG00NXVzvp7QJINzPu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1RSRK4F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LJxcEwIl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CFB606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CFB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1RSRK4F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LJxcEwIl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FJ0i1739180
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=; b=X1RSRK4FwC44esVO
	cI1sZomGs9qQNMZKll3WgSNzBz76KhKiPOTNX8Cd92JSF5Owy7yQcCoCE9xFitMg
	lYK784RruJd41RvhruFL+CWPmJz9ETLflH20iyd5NqhJZRWtAvts6t8MgSKccvx+
	RdlN13cqPuUod8sz84xaCWSQyC+5z33l6uJmAzXy+U/fsjtQY484DPw1Ua3KJyGO
	MMqMsiZ3Eir+MFgJWZDH10yl42lFPdaFD61cXqXIUM04uxm/pyq31qr+oQLcuWq+
	REd+9RJ5DMAF37sM5AaaewgTz0CWaUttXXK5kpoqPJBodUnGlZXM31kd/N7tDAWF
	G9A5qQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhhyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso2115198eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341981; x=1793946781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=LJxcEwIl9hNEzwx2sSHp1VmZWtNgC1rkPk0nfoVXAbpOjKHXL11hHFvIFnAhCUTa6V
         h4RZzmiA64lQEfqg99bsV2Jc/bJTh6lGtvqBRUjD2z7zYelEgmlBfXGdp4FcJOY1YS8P
         rhfc+3UGhdvbkVmezGRWn++DOoT9Dns2QHbfGm0pPv8RYP5A3KHJfvW6agmGM2qVPQjA
         kCiHR1IzNwbyJILopNE5giwsYt3m7tOBwaX5JViItbPMsPvxP2SMzZNmx8DqMDNzs0zP
         QVZ4JusMhlb7LTtousmzeUt72Q6CCuN1RttdOHBZpgCFZkfl/i7GcVvXlamWXg7RPyU8
         ST9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341981; x=1793946781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=iInGwhZwUdGMKZntjL3BB1UA5bFnt71yXL2YAEgrQBbLVUyYVFbMOnPDaE3XEELlYS
         wqXNalfT1ROy9UIve843DbA0gub+Z27tBTrHIVOWtaQmR61ToMMAiGvOQB6vMD9vtyW+
         M7JUs2e73qQuPwNzekN5VScjMV1jY6aacJmlpyC4dmyJwWZ893WiuznS3lVtcMGkAuu0
         BLE39X6zvAp/KKG1sGSYsbTleS9WGDuNzs/9T99tr5IGaKT519gb8XhQaL4zHZukZRuH
         QIksiQUlnCTGKsaTgeDp7XTFMsEEEQE4Ju5koN/12dzi2LDbaTi097Y5UA2PRkJAQq3i
         veiA==
X-Forwarded-Encrypted: i=1; AKwUvBz5UWeRMjNMclDAp+SMoGqbQySs99I2ivBjOn8hhXdibZiSPxLcjckkCp5TqJB/RBBYREjtcOuKAYddRdMd@vger.kernel.org
X-Gm-Message-State: AFq9FYIeraRNCrCec3oJ67EwXWAJhQqQRVvJJBMK3F5cQOfjfMU4/a8T
	nQ5OOLEE2XbHZtfFAMGgyNxVkkfW05gt55RNeLD/dxFnJaW7fN+5KG874MajQDmoz0AyPxyVWrE
	z0eh80B7dtGsvPOTHHjN/5cquFwxQ7KGzgh5gWM0lugFJqRUnusaUXkNEk7HZTk3SHZei
X-Gm-Gg: AYBFou3da0k0VxLlAfolzs4LEHW95x7hQq8KCRlNpLGbrwTAi8/5W1DZaTa0ETC+LWs
	l7uQSb0HULH+dZw2SMvr/LKOB9x8q10HPWgMYPOmXVMZRzY+jQZhxITzZQxDKls9+essBeWh330
	wnHpRTaI+eNkQkvTTyoFIMerIUyyp9n1/xfQBVHgoJrbxbwQ3P3w2Tr90PQVVte+gQnJfZRX4U7
	T3iQIrmh6RCbo0FkSS2P91mKER4dTdXHTJ9h5cAYW5jlVfZ/YAYZM5RaJFl/7+/cJyuuDaYlXZU
	yYWrLWwDVTmcuv+Oj8sPaj2N+bkXrtJdO+pFm8RH+fE/h8QX9wm4Q9e+NqBUgVfmPAN7p4CeQoD
	UrSEevpSgn5/bEeljSnKtTy++lQ2TcWEwYJ5jmYhTBDEg0MFbeE/ZT8tw/9TMgAiNQymA6TpIl1
	fK5zon
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr2427655eec.28.1793341981390;
        Thu, 29 Oct 2026 23:33:01 -0700 (PDT)
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr2427618eec.28.1793341980697;
        Thu, 29 Oct 2026 23:33:00 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm4903419eec.15.2026.10.29.23.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:33:00 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:02:38 +0530
Subject: [PATCH v3 1/2] media: uapi: v4l2-controls: Add control base for
 Qualcomm iris driver
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
Message-Id: <20261030-b4-add_sc7280_mbr-v3-1-8fadcc873953@oss.qualcomm.com>
References: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
In-Reply-To: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341973; l=1121;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=yr22iLCXb30gmSFU65q7mnwky8PcLxD0pxfBcfk6+ok=;
 b=3Cq5D7cJ90leSeixqEjiCRDW3dXpjf8O/0NYHoXUdDai8UnyvfQVDa+WqTCERAtY2C3v0qq9n
 wh29bYYuZgNBlCq082oEhKARfhuZsf5WDbX5tr93BT0dNQJt+GAjSph
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX0OKfz+kX2iMy
 L4Xlc6eYgWTaaBCvXGWdiYO39OX9QcU0KK35ja8plvR2vF9y9Ct4B5ehnQ6tB9/tA/2ZWKZAsyp
 sz97ffqwaXi0qoaj78GY8xFOg69jfX3BIxNAW7/nYe+KdcJstIGFesUOSGS3ARCnaErCrjiIjhL
 3v3Et51buF64ZEq9Wcywu4r9aC4+/NRIUV/eZDCNURFGfuWQI8vCbhEHQNkIk0MLchelh0l4ABk
 7wq1XluHoMYcoH7FngBKtC1IoRX71DGnTBxG/EUJ2MC927woVbKUC/0W6AXCZslckS7B0krJCdJ
 Y/hatzPj1z1YQ6X0ymzKxvbQJFLAhe9XgfSC0nhu7c38NAArJ+wcu3OeEyOJ+61wuoojGTLbuL1
 kCzECk39/1VP1bL8x/V38hVSewg84xmwO+J/hciiJ+x9uPW5tT/mzj/zx473KOWQk4XMNNh8Isg
 vaDpRIPVwWopV064QNg==
X-Proofpoint-GUID: fYmWjkVdsiWkaZvVV0y5G2wU0cLLcvFU
X-Proofpoint-ORIG-GUID: fYmWjkVdsiWkaZvVV0y5G2wU0cLLcvFU
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae43a1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=inWu9NajWAUUfZ5We6AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXyUK1zrDi0HGd
 xxzqeK4aNb2Cxwq5hw6r8Z5TTpB1/4EYIbn3J7rShceVNHE+dLSCds7REvGjRFo0pCAIS93NLNz
 dXekQ38QzXTHMWAhLShC9sMsZz/Uf1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

Add a control base for Qualcomm iris driver-specific controls and
reserve 64 controls for it.

This range will be used for encoder features exposed by the iris
firmware that have no equivalent in the generic V4L2 control set,
starting with the MBR (Maximum Bit Rate) rate-control mode.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..ed2e2ef42829 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for the Qualcomm iris driver controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1

