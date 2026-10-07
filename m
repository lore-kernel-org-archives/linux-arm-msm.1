Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FB46D09F
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363666; cv=none; b=uMTgK+1775WFQxFzcsY2ZXR9GTPiY4iD/qCXDgxFz4Mk1KRS/UX825fz5Y9al22mZ176BMTtjGuBJyQq7jviY6VUfA8vVSAqDby74iNA7KO10BJ6Kuct70fhky477jwK6jDKOkCL5NK1MGFe54KKw09ZTxwnIMf5iPPspVSdm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363666; c=relaxed/simple;
	bh=o+pArcNbJmp2jNe5MdLimuBeqxq5vqZqEf7oThdS1No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhBD0vqdJqO/LuR9Vhnz/if/BrNvDJ8YSm+6Jxb0W+JHrB6hu88zfHIe62Ud3gB7WO4o1JuxRydKcSjqXu8XU1c+Z/Odte+SGrvR2MkO12ZfXngVzY+7qKFiwKGzBbY90KoeViTeUu8QFxc5RPsMTvXkNxA/zfmUQzR82H+XHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5qOJhLg reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5qOJhLg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmFl2711439
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0S3PID9SQK
	AbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=; b=f5qOJhLgqYfx1alyOWBqLPh/23G
	MKD8+LsUXULbmgU8067KVe9KKvQebysD6zGihBJf1itBOUDrwB1AYbLcoDDk1bSr
	iCsQcfEF6Rxib3mT1KKqRTWCyGZHXQJ8N54o8OsN51nbVTK444E41iONkq6Woxkx
	cHRpgKRRmliy2xNurRGVnUafXwQgXiNPQVcezhk0KNrQrzulQBABi2Mowz5bIsmd
	Ssi/F9gw2eNwuKk1mtL8X6p8C0IB3EbzCrrBIZmQBvPGJ8dUvJSO1DtbyL3OR0FZ
	8DdDeDLsCwQYBAaIM2JOJea3Eyu/vPHnBs6iIeXqtk6jZIR8kM+Px/ULWtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1cyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:01:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc5f70c8dso422879085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363661; x=1791968461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0S3PID9SQKAbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=;
        b=pKJToCxZUxZmMdTiMBY0n9Kj3bqUs5RA0A+t0/WgV6+bbA7v+WqmD/wwR/4DeyLka4
         w2r0HfENmWHDOE/W5B0LJSLPcz5iJMmhk6DZ/5P6bI64EEnlS2L2EzUAHif30QUlDwv3
         5g1TjRzzIJzaXuPlNMFsakUld16M3rq241xZOl9/M6lwUfGsvzHsaLm1hkd0zCKZWkIM
         pEsC3df55KZuPFBpC+bD8C/TlswqfFpsSQ/YtEZgusWrQr9ZtjH0y/MafLT658AMFYxJ
         yRi80poNyhi35deOza7+iNPd+RmZqcyzUDB9Nnd5HvUMUuAcrJq6gyMzSPIOENKt8oHw
         KGnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFxrMSgFFp/Ki3fUIE1y+9t0Oaof3r/qvoMjvrt4OYDq4pURRaIPvn7SkFLQKo1VzU+R7BaCduuaxYFrlQ@vger.kernel.org
X-Gm-Message-State: AFuF++ncixC7ZZ4OZGWni+ms560DoYszyhs5zvTQY2WCKiyRQOkvDVK3
	2mNIp/K6nKdtbtUz0GhB4aPTQoz3OXPIreRmE0yvMYteDrjGFgeZ+3TyHP3CYeZNTjkHG640neG
	FVLQBBtkKt5V4HZBpcg6H3cFZfy2RpygDJoHqFoj+/SiA/MYU+3zw3/U+uIvW/pQouJMs
X-Gm-Gg: AYBFou2K8ZQ3cnzIOBvabAO/I7itsFqc2ZU4QC8VpDhPqdvJY3pVme2FQqM0KCNECFL
	1dlFCHQEQZPV6w3FpumB8k8AT9rBvPEJiSzTdWoeHDqYDJyUYDfixHTPxPdOWTSg0WJySrr9tAY
	cgZHd0HshgmT8dAfmDKKdV5A1TnhXkbbIfKxcpDwVqclA7YeygwL/OEI5L9pcYoibsYYwe/qRa1
	T5PpIhP1KZqG0MKKB/gNjxnmaK4Anv4isVlVmdELcdQLy6E6nzOghBTcjh+Anc4t4KzQ+ocx2J+
	QVCc2Hg5SNpWlUudfNMCtePiXv9d6wdegLPhOn8l1D86J5POfTY7sI97Ztk=
X-Received: by 2002:a05:620a:7311:10b0:939:ff11:5328 with SMTP id af79cd13be357-93e9b721defmr197585285a.24.1791363660643;
        Wed, 07 Oct 2026 02:01:00 -0700 (PDT)
X-Received: by 2002:a05:620a:7311:10b0:939:ff11:5328 with SMTP id af79cd13be357-93e9b721defmr197577885a.24.1791363659865;
        Wed, 07 Oct 2026 02:00:59 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:59 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 03/45] media: qcom: camss: keep CSIPHY lanes active while streaming
Date: Wed,  7 Oct 2026 11:59:59 +0300
Message-Id: <20261007090041.3732717-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H8nbdCBnNTZiHY86ZRA4qEqSJDUmq2-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7Ycjr2srA3x/
 RFUb+GVchzqhZX7kLHRhj0GKw3atf+3A56aWIhi5nYtRZk8/Kz262WKGwv7vc3nWhq53vO8DvZS
 j5Mbry86+TvL2g1bB6YYfQwU8y6XLxGcDh+D1o+y7T6qYhyVXYcz33EXUPhiO2PJurA5JXrUPKH
 8JuKz3yppYPGRqqbSEK2vl+HFSG9bxe4DgTax9drVpimiekTsHFs81p9YfAs4qgutAJ2RcgT2IT
 d9IeqeDZNqP8Uh16EA8XQWUi5vMbBwm8Tp3L7cK5Bz6354bC7KbHy6PTIks+EOk/t6bRadvhC4x
 0ztgzd3xwzJ2oMp3zGjtH5uJM5hgdk/rVyNG7OU8jw2Oy4WpKarqaP/YPXIJVXuBnmTQpV8iTI9
 FC8wRzrLlmTSqeCxJdr5zZdC9niqJKG25iQbEe8fo6QhjEZwayTy2VcJRMP9BUTabjcyOoiXb9f
 5jG3bVIdf6xvxhBGxSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1hQp8WhorxiM
 huCH46C1/h3/itabhfjSKCEf1rnjvZ62JhsBLa543Vik4Ab+5/7iqd0ALYmevIR1nOQ5ZnwB7IF
 i1Ab8gKNFeDkzGH4YpxM51O8wMOP3kU=
X-Proofpoint-GUID: H8nbdCBnNTZiHY86ZRA4qEqSJDUmq2-O
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60a4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=0Z5QZsCCh4IwRXeKKPkA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add a stream_count reference counter to csiphy_device. The CSIPHY
lanes are enabled on the first stream start and disabled only when
the last stream stops, preventing a shared CSI PHY from being torn
down while another output is still active.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 12 ++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 9e95d04b7235..4938e56f481d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -324,10 +324,18 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (enable)
+	if (enable) {
+		if (csiphy->stream_count) {
+			csiphy->stream_count++;
+			return 0;
+		}
+
 		ret = csiphy_stream_on(csiphy);
-	else
+		if (!ret)
+			csiphy->stream_count++;
+	} else if (csiphy->stream_count && !--csiphy->stream_count) {
 		csiphy_stream_off(csiphy);
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index e55c098dbe67..8c1eb83de751 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -115,6 +115,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	unsigned int stream_count;
 	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
 };
 
-- 
2.34.1

