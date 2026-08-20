Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F41837BE70
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237461; cv=none; b=JWf5NE/Nm//PgKB3s79rGSp7MmAbtHRGUCnDF1/Wk6bavxS1PQU8C49wIgZu5hVXdHWeq4LGI7WL/dJpAaf5YRl7Tt5F/H2PGsRf4QVbH6K2i05p3ZazTE1RBRRrfKTJS/bzRKszI4zwluBJMBULzNNaUl2Zk+9110V+qfYGmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237461; c=relaxed/simple;
	bh=wo+u3YWeKj+W8pl1NIWMDdTiciUwV1jwvTY3dqUCWkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9YC0MubSPe39PmcKFE+SHHcnA493+uRCszv7u512T2+e0RA58xSUyInnCMQ76fl7NMctSaIiywiPjh7Tz39EhdeI38BheBT7KSy04hkX8Q7Wl78FwV+dHLXeQvAyeJ5IzjbwrghdldvWA8A7vHKTDYWhyWm1U8Q4U9Ox50p/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eja80+Jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhuRIPV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eja80+Jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhuRIPV1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7PEb010394
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A/9hqo/Rrzg
	mEvda3g1SNdYaNhtBxjx7Sp2rY2ny7rY=; b=Eja80+JtIA1Mld6NbiOnmJGIn02
	4j4sj1ySoCHeiH1OryQSi0bvBGwXMzusWmlmOgR6hVcn7bk8mLIVDeFJm/NC91bV
	im/fHcRC8sA4bhlV5mX00QFiJTVWd9A5POyx2/c14cyuX48CXpftk7vpE1wbWzk3
	h/fRjvyX0Sy6WTD/dzEL8OvRz3KAd5OEv1sRitRHu5oUnNhatMAZmTxzUwG0keYz
	Py5vReiKge3uHhJ92VElv3bUoAzEfYRfHoPo8LBmmE+KY3AHDbTO5H/nzftuD9Hx
	PxSTy+rCSCnRcDzn/Ie0mopb7ZhvnZMDNO1QskPPxcCJYqG9Su1DLKEMphg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc9epf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:50:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so2997365b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237458; x=1787842258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/9hqo/RrzgmEvda3g1SNdYaNhtBxjx7Sp2rY2ny7rY=;
        b=DhuRIPV1fAAf1mHeEJdWlzXVYPLmrCzh7oXscjMWDFCuaHtd4pFW9Sg6K2y6BrmSp5
         pGnI/3kx92d8rsYgQvv1QqDApx5WmVioxfPhaAbDltXCNudzweIrFX8pP6u19oWcwHqF
         DgrnkmaX8lKOOed2Jq87hqLkckd7ZEnTFb4ppns59lmJ7WutFvfFXxlhV1i1vP+7ZxH+
         4HQjAkg2XZo7ZyotxsLjLmrjg0es/7ojHLc9yqbqzB1WgKz5r73U1JExsZKio209BT/c
         VR4eU69nagqBEEBaMsTPcFVvxipB73UTFCgAaohmxs7OwvkS0ZcJ8jx0Va2w1iLe1mn2
         TTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237458; x=1787842258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/9hqo/RrzgmEvda3g1SNdYaNhtBxjx7Sp2rY2ny7rY=;
        b=SrznhCG8wQ3pOspWocGbs50BeThF/bLd78D+oFwVnucI+qIvLqTawPDX5sMrsmxoyl
         8EJU8FP1EevNYoPdeevz8G3SmfB5G25sebyTgCj0OSvzM2t75ehg8UojLosZEhiCNYf2
         65EJt9BNRpy4bE7PfsZgWeELl3q68bfLmvYGONR8p1AA13FWgH0aF73IRDNOTl5rZIl4
         UePGB/AIcpQZaTm/rEvK7PTY7qR/bcggnIUk7VVn/ZnT2nm+lBRoVcySDKJmbhCocwQu
         UYhouk5iI0Kqw6yutD5AuqyiC22LTYiiN3qzRybRC8vaqIqGKW3KEqsQ8bPgyh8LR2V1
         xM3w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Yny1jTJwPMuInOdv/+pgO7AhiLsjr0EsPPHyjSPhP0gqO796hZSSAvXazAJEotuL6o/g+FQeHSKKd1Pq@vger.kernel.org
X-Gm-Message-State: AOJu0YzyGdJySWwB0Je5v5SNvtLWoQDT6hjGEaGuknA4gveeeKK/hyLI
	EQSMujhxHnxfC4jO51EloLCve5kC7/qFRgyB3c01S4opDH1rwDDRGkemomNn8ZvQGInnYGCqzSU
	2tppZS74zwrBAu/vWcXY1nPB3eQ0wwE5jjWQhC4lRrW4EUKwm1zuE3aXothr9NFVHbx6v
X-Gm-Gg: AR+sD10ZUoJ4EEBJEspq61swSOkIDl/+T7nMUDPFNvbgZfFZT4/rMKkgwD7wykW8zuf
	F6EUnbELoGfH3D1Oa+Sy2v32/q0wowYRx/NHQiKsqLijc2Xr5KvsKVpYpRMOXjWkayM74gUszDX
	0aT2MKMKg6tVYTLEAxda7xtYqKffVU17l1YgL93JTBCOdCRdH+GSQi0OwtQ0iMEMg0gaVdPgnig
	C4FhK17XULwzGmmWsiy80Heih/SEw+H5OqQfOw4KwyDsLbyZVbFdG0F2B8fuerxcSG9Ue6TyPeq
	JoFPAXHvSAMXdROI62GXoSH93MccvpID751fsAr24E2onblsSEb3KBD1em+A8wzB+WqcSLkmPki
	VKdFuTXu3tjqzpIN3SSAW1vrqd2Lk
X-Received: by 2002:a05:6820:2d05:b0:6b0:b196:99ba with SMTP id 006d021491bc7-6b13c5a269fmr12788654eaf.17.1787237453655;
        Thu, 20 Aug 2026 07:50:53 -0700 (PDT)
X-Received: by 2002:a05:6820:2d05:b0:6b0:b196:99ba with SMTP id 006d021491bc7-6b13c5a269fmr12788608eaf.17.1787237453282;
        Thu, 20 Aug 2026 07:50:53 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:52 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
Date: Thu, 20 Aug 2026 20:17:37 +0530
Message-ID: <20260820145036.2035641-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a871453 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=5ttfkXOUkHmYICtgt44A:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: tzkxjD0f7ArWGadr2PXkNAy5o2ytaWxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX53L/YN9iOB4O
 GSGwPBM+x9rS5r2GWcmWCJgN2qRPsOUSmRoFx3DV9yr48OtizXCp9GW2ovdzWNYLifOHoxnr0ph
 Nn/2OydfGwnX6yX7pQyDJ8MaDj+nIq7x1n/W3rnEASB5gpAfaxG7b9XC4Q5NrL/snz/kfDlJDo4
 DfHho3ATu321+yHUdOm19Lucbfd8AP7yHYGeu6Pq2xZDzpCtBaZiIi3faqKzDOqh4YLJ8ZALLtm
 rOf+K1SekykET2ebu6SnYJ8z+F+igZ52IWbW+HpRYeoZU/a/4r/lzEUXCWmqzXvbhR7K6tEwofK
 Lnkqa4DhDHDy6vnhbkmlj33YGi5e5INPrXXldvUdkBsNulV2dhrAWOmSBOqhED129g5DC2CGEJD
 PAa0IDWaAk+hiWeYaArmWNhYaQz0TFuSj7eE9geN98WTbDC73J2LoCE6uYRWQqV/CnrKtIQiK06
 ST7lcLS+f9q+uyfG9HQ==
X-Proofpoint-GUID: tzkxjD0f7ArWGadr2PXkNAy5o2ytaWxz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXy7sxDeJm669k
 lz+W6fUORPG0q05ILwHabqUJRL7QN6Uwqgl8NK5+HZu7ztUoTPRGmAkYb1q4drmQfnbq2f/p1BM
 Q+em+ce4aEFVzlJ8eUCOMrxhEfYmpQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

Add cypd6129 and cypd6229 compatible strings to the of_device_id
match table so the driver binds to boards describing these Cypress
PD controllers in their device tree. No other driver changes are
needed since the chip is accessed through the same generic UCSI/HPI
I2C register protocol as the existing cypd4226 support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d46ca942026e..37b96d662e59 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1527,6 +1527,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0

