Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430874;
	b=RYBBxx/2PL3ASQ9CwlFBijwc2cOAeLm1k2avzhvgmEOewJFcSjZx8baupptqUvGjplZA
	 VswV8aqbvQvOV7z23FGyCNs5a8pctQrIOx3bvcNUfmZHNfGjYjVf4CX8byNtQiulp8vBg
	 J63JFlgmlP0v0iJ/fTxhKz5y9Fj1CQgZdsJ7HdpSJyVaykcxVIvpLSdOPR18T/azw0l2j
	 Ur+GQ9DiMkkqBxmiUZ0GSgkvUYjfDjTFyvWAoMVyCN0lauw1WSgnGT1tXROzPCJPjXbkd
	 AkjZuuwXXTfHC9i+g1dlExPbY7x6QW8uTBCytZjdIhRFldcLFFtG3tYKJjgai82lkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
	b=tJXI2uxOO7OCAgZjs86EEvvSc+QzmkvQ8Lgpin0hgRbKWIiJqppgH2Z8xzHl7igjrsqr
	 POQed672cvRLEbJKrIY/GHT1bZBF5+hPaCrE/yK9rOP1U69QSaYsILnDLT14x0n9lT+hX
	 I5wwq7/NkbNS5+Uxvjxmi7wN8z6gtxw3omeU4WUdRZavIRwERvJk1bsQekLQtznqSpelH
	 3g2tY5wYK6rZEZs8CMcF++XciSpqm5K3aXIkuApvgun8KXz3h0nlTzKqlPMPaYMjJKY6T
	 vIJnpTRbfhMwUALObTm/Kctp9+UuVHgzQGNPzSRsC/aYapNdMMjckOgAedtfA3eseug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F54606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F54606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fufu1395965
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZkJ+rVwIQ8v
	5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=; b=SvUx0kdMi1jka39L9W8Ygx88qBU
	NqPK/oy1EnLsd6SqYoGFnI6S81lXgfRHWu+xA370ukTljdIusnvbfPgXHePM3iwz
	7wbwZH+fOz4CYJMuTFpTfOilqY9srRthsQxJSTPzRLvprmC4b4nyxhQzgqiy98Hb
	uqjEqJ1lSs80d/1U9IXQVEWFFxcIDxjnNSClTQewUH6W4xtYFOpV1sW2mxQfMvnE
	ZbM6cZinSO4G/Fr8cO5I4UTPyPuz7x+puL7iqV6DmBXKtyFo4d/xluFz57OvFIYq
	Aa0wNiyDsuxTT7ALOh9qYpf1byG6SiMwjcjTogHTd3Iu7DzYtv/Kf2DfKHg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx17p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde9044a96aso555799a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430872; x=1796035672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=NO3ouOOMsGAKQqxhs+kP3wMese9Vw+36kTahtMRgUql1+Ipg5oqxJIaRelOEjdreAl
         XmR+le0UZldZSwyY8WJdwl/m792t0NYqvcBX6m0E2YaOqvS3AwtUS8W7cF1I0sRvGRVu
         9vgFlXYvD2WuslI9iDI4SnZ2fgo0QRFsuPWy1sDY4Qk9ZApvZqwUcfFB4jiDzXviTKbG
         Qa42+xteBWBJwPezLIWPYAMrIa6OUOXKzEMSkup7w916LBDoCH5Dg63mNG2Fduq7CT4p
         E0O6+ut5H/KwSN/Q4cBepn9hOP7lzjAtNQBS43XN/6mgLll0qavESVL75GO7SxTV9OC5
         XZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430872; x=1796035672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=jEWj+7Z7/xbJ5YaEuJItLnAxsHyT6KX2qZvQPjS7zzOI9dE1v7zvNBTD/N8qj4WgvR
         GfIA/cGOosiG7ZZTNZ3sqfIKVmEoY50bNiHDDY/4w3NA//Ba7E46n1Xc33R3xFIDI/Go
         8dQIvOuT0eKhyRzyvTQz5sH4cp1BISg43UzTaplKZ50Qc6OYMdOeB0OPWM3ZGsAC6c4B
         o78dMxKMoZCGq1+vf0+4EfUob6f+ZWgUnGt6kFSmDsBoU0L4gJkiSNlYIE5c0st1glVK
         vHP9yIWR6RgF0Dv/rZaHtiQqLZZgwckvlu4xNz0qwOzKdWuP9+eOrM4ueJg0ZyrSEtm4
         PjEA==
X-Forwarded-Encrypted: i=1; AL+hErF5wSmRxforuqiwdjXqt6FOuuglkg3mOK6nIc6I6oAgMWvqJvY2W+b5N6qkZP1HfS/9JthBY0wI8beZjm2o@vger.kernel.org
X-Gm-Message-State: APuU4Z/WIUBTtONjWri2lwwDQ8N8/c9/NbmViIYhYMilDet/8v8dV57t
	7jtVCbyMQCR+4ngsQtEyTQbe3JOY7yRZ9S75DiSNXW0k+EGA9SasgRRWBi5meoy4ktTw7VFgc8C
	YpdVyYIt/Xxhq44xfSapgDt92BAwBEvcRuw22YmAadcIo1dG9RMiUVtpAUUGmUelpJtJK
X-Gm-Gg: AZFdTZdsHFfGeH5IZ4bcOARIjXMToI3aFKZjPtjqLYEU2DFcjgMca45O5B2H8DmR9uq
	6b1EIGnqPXyjHQ+/CI84c3zRzV7FMftivYd2Dzc3JD0X7kKZdnYQ33YBX49oEa7XIEk+V7ojODn
	eB4VTzQrk8uBKgnx0zF8KyIbNqY5NQK8g72Q+9YVyUvjhbNtQLAsGubI7eZYhtohO+MTweF5cZc
	XS1bp7w8qIkm4ouwDraV7EytejEdc5p17jzSsZB1OUlwkbTGwqS+at3bYr2LUK39JeTGfPy1BmP
	h2NH5sqaPqR9v7NG7WoiqFBcmbidUbQubHvMMO3mXpcmt2ItBI94Qw+v+2t/QeUzjX0PO7tQi94
	gL6vJqXkSbRwFMNPPLumPDCMb5Li7sVLyKwzZ6ajETOph0s5QVAUKMV6qwfl6U39AY1kT4pfNBx
	q39cHabQ==
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243525637.57.1795430872461;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243503637.57.1795430872028;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:51 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Mon, 23 Nov 2026 16:17:18 +0530
Message-Id: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0419d9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zjLylsKXzqFT3lpEvI8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: iMPsJwdzp53vG5Fzx4KdNcAz03vWLxrw
X-Proofpoint-GUID: iMPsJwdzp53vG5Fzx4KdNcAz03vWLxrw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX5IxDkjiUPKSO
 aAlQ8uR4sATHP13T0aOwbZrmjejShwR3WUi7FNHzLxSLApF9VwJldUAvivevPN7pfOsN1FWzN6K
 yCaligsh/2+nb5uWNBjptXgPTnJxD+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX5CdZNUzMay9z
 Aq9LVCRCtbgf3CbuIXddMbyZ3XgarK62kzrzOELm7FBfRY+SwzpL5yjz9rHhiWYoM7ciAhTCRYz
 73RfWYCuM8Bw9kD8XZyCHZjQHWzEKuAY44gxvWaUVX8tu2fisvEkj9qekFSUs6I1K6G7+bywp5L
 QOkoL3F2zgCqJlh+bvAaGNu9vQfPJV/zzAoZ2vrwExBwTKkdKSDaKYXftpZAUoO3tcqkOUI6gG/
 05K9Q4d7xpkJobtglA9VoC2aV50qdtzwEnGRaYA/XjnqipiG1udnKiahAWA/ZgsxjLbnQoxMcwe
 VHnDZU51qBl1R3ugC/01C2vBtGNKwthwFM6K4n1moVtep3e6blWfQEl9d9NoKBIzKNoDEv4BVSo
 FioeaMC9WwDh4jHLzLiNhHupdS8pXmxgkBk3TeqQX4GVUtyQW6b8hK4+Pgsos+HTZ2BUVR6W315
 o81lmjh5LgEC57Qkl+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 18db19cf2065..e7fadad9a4e1 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 /*
@@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * If a later step fails, the wakeup interrupts stay disarmed, as a
+	 * level-triggered wakeup line could otherwise keep firing while the
+	 * controller can't be resumed.
+	 */
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-- 
2.34.1

