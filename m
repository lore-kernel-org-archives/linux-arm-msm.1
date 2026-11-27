Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761643;
	b=L+gwohoDjeOeBfy2HRVq4ZOz59LT+vD/xbchQLGfEX54/IcaSKdki4zGpUwXZpqzjTLw
	 Z1S3u7+pgHolRMBZcEWRg8I9cVPMDA8ZdK0jKDlQRcQ58ca5LeGAXKQJXMHv9izyXNJ2E
	 ZvteC9K/ovYG9mr2N7SpFCrDwfRjVzjfNuXRlco7D2bUxvASVWrM4AGE4VW9iFq2CuBO9
	 q5vSHHOifYxQnezRDiKmfOaMxbj/k5F91lfv69GkmUU2Mr2Hlay+FkRoqC/TJocNvxZF8
	 DBbTcFR8coek2auL8Mg11k3u2jdgL8WKwrVETzwWj4xKVEE5LaFDEmc8pmz8btaQ1mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwXzZxsgxZg=;
	b=TS3XK4u4UOGOh7YlnH1pxZlP/LKK0XaFN9PAQu2obqqnJJYEBsiwOdws/YqrcPNc10k7
	 89A8MnNbXkngQnc4yAi3VgzdC+Kwzq0ovAZczhsRMOv6k58jHtebaFJoDnLT2OfUFJAVS
	 jJNhtcUJ0eVM6AOk3yzceTv1wnfp9VR0qeN/CvCGPCP5ULKPx1yI3UMvshpTVZJ8pmv9k
	 pPoORMtFNaC+jjP105I4Shf5UBxVYeU1RqlRknmQHcvRAf9Hf2ekgp/p1FTJlju0UJsdq
	 GdN97+//PiYHCmWchgOyNtVjCwX0/sGvFtQ4nsay1SSDXTIIiDQERP07+sywl1MW9gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghCaD60b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i2elbC/6";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AEF606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghCaD60b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2elbC/6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR0lsFr375482
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwX
	zZxsgxZg=; b=ghCaD60bir3Y5XXcaA9PxUWmHLWZdC2/3RPn4WVNzZH9EvnG5Gj
	B9f7kb0DzQPgjSI8YBGYnMwbjGkkQpEyb9yMOKqbf9iQAQKZMw7a5qkoXeqY+Nya
	Jygel3NT0b7TqeylzCNMGmPLMzsPw2uAlXWhIkxCNMUT/9YoS/SEdBw7lM/D8WPC
	qxUL+nVlONad66nQWe6Y5kC1CkOHSo+7829QVK6eUtnqdWVRw9b48bOOxEIAv/xt
	8LxhxoNzPsBgUm7i/PffhZP6SgA1P1xCy9bEbh3/D83ko0781HP5s7RyCukctC8Z
	NeyO5/5RpIGzXd5gwhcDmHvxqSw+gka5DAA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ymw8weu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:40:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so9700915b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795761640; x=1796366440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwXzZxsgxZg=;
        b=i2elbC/6xVkQgcGHtWRzGzEtFKco48FTNJbdTYk4iadFKCVMushd6XlcsWWtkgzR5V
         2CeqnzhOcwVSW6m24Ws/bQyBpb9ZbzORcmXefIQ/cVOVr4GLFJEMT+kn6xj3VeVUYZb9
         41hZPzV4QBAeqy/wJ6E0HlXnZ1bXTPS2Rsd5fvvRh/oWMXB5QcwN8pwal4W53TJO1+z6
         zfF8gbypthhcJxfmRtTdQNB1DG7WeLeT/OuGfV+sQE5NT9yAkt7bvOh+S3XkZvgaucBK
         k6lyDZdASqRlI7KICHJSSpHfZrv5kFSZUpzLOn7bCpqCBcrUtvjMLulH5CZk0I8zHqgM
         fRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761640; x=1796366440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwXzZxsgxZg=;
        b=aeeuWnncZNRJC/h/SxHNDlSpMLjbMzME5Tlnz/El430FtwuWQO5mx/66GuB3uX/t8B
         9PpW6KTEqH8k4ntwB1rbqz0qx6RX5Sbu3NrSoateaeeM1+hFxHwLe5tu6Nie+bw7nhll
         uxEfr6JE/Xs52SMrHbqAllh0Wow8hVe7k7rXvPRQi5xVszwQ+QW5VeUG9vr3K3DrjqJX
         DMgFAEoQl7cHWvS8OKgUWmP9IbZ4GX260hOUv9fUHYe9ozubyPJMYp/XeZay6T5FOtbP
         t4byKj404p/kiM6gEJ6pZJEQCxNBWBvhGh9YuXxqLmHckqGXSgdevMDFFq7SjQEgLix1
         SK5w==
X-Forwarded-Encrypted: i=1; AL+hErFma/LA5ca/bu6sEbjot9dF9/LH7aDpkid85uarT6cxhWcyqMfZSO5gkJLwEXJNNd9eckIiKFY4lnHmYP9m@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyOQ5hcSUx3RzNQNsM8WHb7QpsSkabWRu+966yYRK4i4GUzGN
	mDRCx8KrrjTiHwxsiI5G68ttqdPFS65Ca41Xpqp3k8gF974rww5g594df8LvhveqkyJvV5aRIxK
	PsvwTTNbgfs6rBPmaI0ThIsj1dafznyrvqRfMhjZ2tooOeoW8QbgG05+9RhZfq0qfm43X
X-Gm-Gg: AZFdTZdxaikq9T+caGsExYUTOez+YM/YJSsr455+nnde7tBFYWYjt3F/bjHp0vMC4F/
	APZBa78H+QslJ4MW4WG9XqPCEqABQ0XogfrewQjFeBp5I3L0a9tFdIG9wZwZtJrrA83F6T3aw7P
	AZydzOiGcuvSk3m1zfIR+cabgc7xCfoXyzmmv0DAtrfFx8Dv28cC9kMPvt2i40FkPD/3hl1NFd8
	g90Sm0vlV6/zKsgYp2lKZuDIZA+QJ8WtcyxB6V1PDTOLpUNKz2MUX6DvyfAmmQ4reHVHdIBHUCV
	Ax1A9hGDwosudtjF1aPEbx/SjYgt1X9LxUGe2B1hK81z9D2peP48xzsKhYzMEnKlapiBMnEjdjx
	8viwb3krxovxwruVzDuRf3eJ8VUiee7ULp7bO9y4OdsibBJbxKzzAFpA/5yeGXniuexV4E/O1Am
	BBtuBlklY29eKonvTSowuzUmyOIX78ByCzY+Fs
X-Received: by 2002:a05:6808:1911:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-57a095040ffmr24374745b6e.23.1795761640376;
        Thu, 26 Nov 2026 22:40:40 -0800 (PST)
X-Received: by 2002:a05:6808:1911:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-57a095040ffmr24374731b6e.23.1795761639984;
        Thu, 26 Nov 2026 22:40:39 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm17219283b6e.4.2026.11.26.22.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:40:39 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neil.armstrong@linaro.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Release DTB firmware after loading it
Date: Thu, 26 Nov 2026 22:40:25 -0800
Message-Id: <20261127064025.1948456-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX8ytCa1lg2uz3
 0Qq2cZQLrQi17xaEhV7GjgSCQcKrCE1h6izHvKcIV486vamqJNIFxtUGeLxt+msbf8k9QssvXca
 /QKDImjwwaS82bYE7D9nTSq7DN1ielo=
X-Authority-Analysis: v=2.4 cv=ZKtCCn7b c=1 sm=1 tr=0 ts=6b0925e9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=y7k6Y5ZFAmqM3zf5DFcA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX3VfmtqomGUhQ
 IS90kZNcS7KhydbHbWBsBrmGwkFjnKXwVhdY5SNfxSo3FeR1JRoE0FdvZZqup8L1auInt1uSkRd
 XwIYQaVLAoLbAAzJv+p/t58nxOipNBuAu/xE08hZ30KaqXprQ7wR8AmRUew85gmTuS+G8JETLqa
 Y8fdQqNwbmYFwx6kRYevYZGlJrVUTVmtoay6mi9tQmD99isOlBEjqYE5ugHOBvoUHQ3p+oQP6wz
 qrJep1hWKDVDCxurvuA1UDMeLXk2WSUdH2vJ3SsZCmoWdDuo6pxlV49XBnFbnaYeN17wNqYO9A1
 QfwMt+N5KkCP5nyViP2PYetEU4q0ZC38wcVyg4fEunT/k5pXWXKwLppReYYDREikRA7AEHQrAZA
 B9t2LsDU2GeTp4ZXsnZHgAM8yp5TZAaSUaN+SDxOrZ0kUlxr7vC3XpYPDjDvrMuSgAihx5lwqJc
 AGEYuAu1E8GMIoLTdBw==
X-Proofpoint-GUID: TjlrV9X4MvQXYBgw8mLS8qoinnextKng
X-Proofpoint-ORIG-GUID: TjlrV9X4MvQXYBgw8mLS8qoinnextKng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026

qcom_pas_load() requests the DTB firmware and copies it into the
carveout with qcom_mdt_pas_load(), but only releases it when that call
fails. On success the struct firmware reference is never dropped, so
every start or restart of a remoteproc with a DTB co-firmware leaks the
firmware, and the pointer is simply overwritten on the next load.

The image is already in the carveout once qcom_mdt_pas_load() returns
and the metadata is retained in the PAS context, so nothing refers to
the firmware afterwards. Release it right away.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ff2483529d73..d5269a57cbed 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -284,6 +284,10 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			release_firmware(pas->dtb_firmware);
 			return ret;
 		}
+
+		/* The image is in the carveout now, the firmware isn't needed anymore */
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 	}
 
 	return 0;
-- 
2.34.1

