Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736355;
	b=weCuYv/+xGmoobSRrQfJeFI9CxruHgelm3oFWbd5cpXtUBH7wFGW/UloVU1YDLtRFZ1A
	 9SnHC4nhVylDH/7f7hQAwH8Ua8oALwKLgxVLfD1BjfDiTxE6gG3wKKPIfBgX/ffHp1EEN
	 LN0G6yQWmuyRu29xLahxKzRFrCydnVD3nDhBvtaFYneWQG7oTh11XkbVP25UhfwOAlc4H
	 at7tec3C4Jx/Dwq2K+aJm7PpoyfASFa1zkOgJ/G81+VpcJzJfPpkxv25N96r+gomQm1PO
	 4d8EgIF5HgMR7wKgMuPpHRMl5cyspJpiSWH3JM2EIc9rhn4SYpIjwjo6EK36e9bRwzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=mzBIlWgC5TSY8IerexbXkPwTihNqTQ6deFHZ5VoGucO9PFxRob2ENqsY5tawLvdpD/xf
	 UbS93w7vBPueEMSBGVELJAwAtqX6NGWNMiLC/SCFW0IJbXuc47QhLIz0L2jyY9x0g0Ts9
	 EzGwaooMp1uUlzSUleGcQL3CXgl5E0cPU0fcw0MZdb5S3PQEs2hGuPyvgEhjfFUb6jrVg
	 0cqXVtKfJmVZe9tJ65FxuCh33s9pG5jozf30wj7IWG0ayjQ9BpJ9iQaW6dKGQWrj0cPBA
	 qDzyX+hkXSwA9JOa3/iLxP+ufNcXzQxsyxn8XITnNzzvtPNKHND315OKeuB6V+gyBqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A8iYZke/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF9606A33D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BF9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8iYZke/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZE0t2041092
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 20:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=OrdkKGXMIYie7ZBw
	gX1jlhQeGe0W6e+SD2J+U938n/FIjb6t/MrnoJrjkj9ngAeb3GyWdxwYhUMijSz4
	c3MESy5kh9H1mf14YhEvsnc9EaKlIp1CnNSmOtUSa1tnBYWGFSqMV5ru+0SCfMyk
	wzcaZ+gwn4ZTlGBFp4Q1bLIHntDHo4XbHS8uKEWRIuvtNDR+IqmjNaUSm5I7U7OL
	TYg/LWQZ7thcXer47bFvIdxhgoVaeJgDwuP9+ryUvJJE1fkf5NfROFm+5+Ov/qaP
	hEgb0CNvqMcydckZ8VngxuvfEki4uNsQX7ujeWJ/FRwUK3mE5jG+4kWryOGCHAeW
	QfEXWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd19vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:05:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d06f3784e2so1163756137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736353; x=1794341153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=A8iYZke/o8wtpJunv+zXr0VhcPeHQyuBbFbYkQwcpmlVicQx65rhK+ksKl8jrhCHc/
         70Sb0Wz7JCgpGTyAGauaFMNmAsHPcVxOtl2CbTEL18SNcCs7mxPZ+WOiRvuWzkyZGagB
         d5CEEdKlu/+Nn1YSPB8wD3Q2bGppdm7fSBUkNZ2EtqpJIz4z7fsOMvdhKHSbTWSUelDD
         BWNeUUcJVWO5OFI3ikqaSbSV/eB89elGVox13SWGI5GJ50HJXQQOaH/6QKKXYxWsilJK
         ogi6n3BpTax+g5xwRotoMus0iyTVO/SwYasf9Y+hP52EmgvpFLC1q3fRmkY/6pPS3G4E
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736353; x=1794341153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=yJiEvL3iQkquxeP9Y83w0/9Xv5728w+cfPmO5aJhClXV1tHNG4jCCC5/4SAzChBkPi
         uDC0YMvcjZqdzxwaRY9+bYv0K9nx4G+WxuOjXWbgqlJ9o4hcUqO5ACuchupzTSO6sqll
         QSf3Mh6/E6mdZ1EaxXMwUxGGrlMFK0IZYbUfFNNK3ZshusoLe7EuSnBZxxR9kqAthPrn
         a1gK25bPs+BtpqsiUUdEAEjiux8JhmyQ5nmnGlIAMZXmnDfxd/VyqaWrgwoI+pHVYDYL
         lPv7poAjMNywBlhPteljVrwe+d7xrE24hGvRknXr6ouJxIBEp9ggXD8LgijfzXhQQW2D
         SIoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1qrURx1q5XewxccnrmZ8LI6CIE1wD5ve8XOim6LMU/cAzI4LnpTlGajstDsSlVY9pY4VwlakdvaBrsGmc@vger.kernel.org
X-Gm-Message-State: APuU4Z/pVa8pd0QQLcE5n35c4oVhYAhVkWbx+sDYUFAr2hlqzPXbAsie
	aWGwUzM4JwnWYFhmf0n8vb2COlTBSbyuwS244HYlr2x8bm60WUcqx7cXebq5cqDEhmRC+aqTJpk
	FpJXe3dIBx9a9lrQMiyrGQo4QNLnuFcYFBqGPkPFDEV6hpPgs4YgkykdLC/VBPOd6zSIl
X-Gm-Gg: AYBFou1wrx30z2SXE+1aFms9fhucItgTUKBrGW1Q9JLI+w72hCo05QtYfM2zCXXqkqI
	HNHs7sgjbJbD0DeVeFCo1PZ4azOYUi9fEIlMvx8uddcnxF1HSiDfZtBel1W+782dUcmdQteRcbm
	L2sdoPNe0fwT9kblrA1qvypKDN/BpeMSxrXSE3ARsDB5YlckvBFjEKB/d1/gwhFaWQYnKgMuT9Z
	06dnbCpn7WRxivA3JREY/eKIUCMP6kXo8oFA8oiGhyIW9w8HMvCJbtk5J0HuIPO3i4RWh1I6JeU
	20vGObL56h0YY6sMZ94u765/EToKTfEwHHk9pe1Zw0+CM+dHOv2VK22gukOPuaNXohVN7UBdMLm
	E812HTY66RZtAhYlCTqhaIC4nlHSa4fv1PwUAIc6rWecnRj7FDlZ1Tu2K9Dgl4+ViFkTuurcDlq
	mxu4zUlYoyCz7IZjfwWPMdvwj8mcA50aCnom22u86oyuk1BgBwT0em4xlgS9Riwp3qdtiIHOYiq
	id5nvUI5EnZARtj61YZ5/fF3S7P
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651422137.5.1793736352893;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651401137.5.1793736352383;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:45 +0100
Subject: [PATCH v13 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261103-camss-isp-ope-v13-1-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea3ea2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: w39MRqdtHQu0JIheghpABqmwLqRl0Xer
X-Proofpoint-ORIG-GUID: w39MRqdtHQu0JIheghpABqmwLqRl0Xer
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX0mAWRv+F5wxF
 nnl5d7S3lOYU5njkaKaQiqz3wQZI6MVRvjrvZLh2p3BwkwBCnzarobLlbqRKvqYeI1/SJGdqTSv
 VejX1XHyjjg/K9tHLY76vTF0X70SxlE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX+L6AVq0ATkkq
 WwG5QVseCFrkVYzPZECNJ3/FoqtZ/FjKNb8PLfxLv1n4wmEat3r2DpM6auVcUG4kNSyLQVX9nnI
 pfHZaKsbCY+CsfYYuK4qpl7ozXR18FnONDZYfocsl53oxhxsJBtiLerYc6r/XB8FnxOQC+WGMyX
 /Os82FAzF7VvUn7q2jIb6O3lG1OZW+tIyCbK0sLY0XHuLsRUMoBOodhl3U2/pkHacikwrkpnjaD
 ArFw9YVCmMX5090uWHdHo5Q4EMr20NxRgLsVms4mcVYVqsAmzs6iQpeLydBh7x8LacZLvUuZ98s
 tdU77LCs4gBEuvP50pnQ+KNe+NBU9vF3k1tVzv6HYGsrODRFzrfC3I1tLyZLlMlbGqYh0mMzRik
 zSF5i3iL4Y7+PHPoNP1xf+PnlD+iphKhRw+io87Of3mfTak6hvErJfTEP233Tojrm8tDgI09Lfy
 o03rsiZ/MNso8ZnP4+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

