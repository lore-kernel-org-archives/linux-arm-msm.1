Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9833C060E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740067; cv=none; b=CEegvCn6sG/U9QjccDyU3XwhoiMFQ+Wx/isU/Ss2ONaUTNBRL1lrPdzBCVAmxOq1qkHzggyddE+eR413qN+dcFJJQXRU4bqT3jPeZN+l93Cag9iRXAuJDG+7+cyq6tWM8ZDTWoJn9pdokdC5sLGw2Mube5wvKwp7tB/E5AoN1co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740067; c=relaxed/simple;
	bh=4WRilBWhHzZLU8uvO/z39X42z49BUIa3+WWApYbxJ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCz/FFu17nRdNIZ7jSgPEGk0yYRoaMuonczjjEcL3/6sTdF448pXZWTF/zJ+dqqKD+tUnNWxnvqX8kUef2lNhnnyR+JxAdDbjqyEL7xpVTKFSEciQymB3f/lGdOF55cHH1q9fgARDz0W5ZhhgljSgEilwjHDebJMNAdrXoQBKks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3ToAtLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTOhHXwO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3ToAtLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTOhHXwO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGVCI3732386
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=f3ToAtLnnYAf6zOg5679hxdEAY8
	VinJg18H1mIPlvYvTXCu7/GToxUrtiMSrz0i4hAGa6PGY9m8KC5p1dbA0/DjesFL
	dOCuxSXs+BwIxiv6K8fQJoKEdVI6f7mSCow6kKgymCiMH8ypSKsC/J2p5Ubw9f5k
	YooO9OMs4Yx7uMQmvG4yZcOXYy5Krbjq1qBAdQvdzvx/EpaLWWBLYtJ3zWiU90qA
	u0zX7s+7c6bK4AnHveNHlGMfy+2OO9Cia4QyjUVq5ZOnJNa5t6i2TiTf2TG4bg/t
	J0bJKZvwrSPXWN2foz57MQ5CRpf7vaP41N/vW+g+OdvJeN9kJsxVDTvzTzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqr709-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so3628191cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740060; x=1788344860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=hTOhHXwOF1hi8+izp9pIArNvDhV9QsotS0KjUZUb5pEDirGopaPVt/YgfZWvuNgjHf
         wB5ftNWkk/i1g9I84nhSOI/9+LrYvuzI8SIT3UQxLSqsFydgtGHsykzxWJ9N8m+mnpU7
         SEZGC/5A7XF+WbQ3P7DJW9H2xzRd6+6rf1tRkjbJjbeCT45UjCrPYx0iX3MHCznj6UIJ
         KVJUVf6Qq0oNOPmg7V0c2H0l15ti7HL4JOsZPvGxWC3ttnyXJX393jopR5L+RYfHBdlV
         bWvzs3KTGdsZa9TNdDM7Li48Q3FkoW1Gdx/ljYxPxaf1olNWGKqn2Vs07g8BWRnj2pPJ
         qqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740060; x=1788344860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=iJKGw5zWdAngKMd3AQXMFxm/rUG4RQ0z8MKYc7EGkCRDpoz8NO/BpaU58pXXqorlnl
         iBPgTf5ORE3lyRGq8mwafeSGHsm5QoujwjCgQ+FQcRknfCSDzVgCxPoj4P67LeZk/5ai
         naWRCls7AwzxOu/VT7nIw6EGwQkPfRPhRoYcITJgCqimtv7o2BmSmzSb3rD+/uQgZJJN
         BN4EMhEmjQoWfEyAkSczJA4Gx8dDuSztsNmwVIXY3FXw/EBjQiTyWsRqY+Ukl/zMlRET
         J3eid0/dVygGjL++BQ/ocVW6BajEUTHQLj24k5C5FYP4db2cfs4K9xC/dmZ/MOaYOCzh
         DiFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5A6xCyPCm1Xm5JsEhVgKgXnNFXbPl02CqMdyk3SGwcIsLlKv83wQtpBDF1p7bnHI2LBOmbtCj0+pmU19t@vger.kernel.org
X-Gm-Message-State: AFuF++kY9S/qoLMbReWw7DrQv4w9UIe71riNvJM+gWdVeeA/hKLZs8Dy
	4I2WnI1wNronCF+QvhiDfGqHg4rrpX/kj1deV5J4HewmjrEohhTi8yao9djs8T84XG4LgHnItwR
	DeTh7LgueLg3iQijha1INpzp4nh2SPrPvSVvkaF040Ypxeo48UrXCcEwvvJTf3aBTjg2N
X-Gm-Gg: AR+sD13BnWtk71wBGk4KQdTYHaIBDO+CME0CmGULK/LyDOZsDkgu0vr5NafDlsaAMf6
	c8yN3viDBstO09tPcJ/M9V4nkI6eA5kVHAAb44QAYyeqvBTkz8TblZSqvGMHY4rwpN93d2qaj1G
	Lt+8d59uj3eCeEbr779qLDwdozDE5cGffsY2GjvrfW0cLzww0nc/2vgBfsIfTbRdK202L6Zo2da
	E5O2HZbMnA7wFHlzYGPD3OmU/diFn69F8JvG4IFDofNcabNIrl1zx560Oxq/57SVdrbQX2WTDlD
	gmWk9Ayz5Eyk3mSjOo4aVSy2iCJmHT3Mc6p5ueU0QzGH40DpV9Dxpy7gO/m23NBjiK64uECEF/J
	yKC6MfMqBtKIqqrL0mQjXcfTAr//hZBlzbSQkw+fiycF58GRNJgTL8/hlcZpsf0SfKXMM+dWNYm
	E8CFE9Q44iY0Wt/pE=
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2032161cf.9.1787740059600;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2031811cf.9.1787740059146;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:38 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Wed, 26 Aug 2026 12:27:33 +0200
Message-ID: <20260826102734.31766-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX5XVuw+fN+Vm6
 Y32BpfWriWOwBL/HH/ssw800GRPnN71znMIsZOUluea9g3AmYgAOlEW7xwQMSrH1NycvTttH1gd
 QzYOkyM1CMUOxiE8RdC9uoxZ+SqzllY=
X-Proofpoint-ORIG-GUID: cWGBTmjA-S4hYupWbuV47lL2pOL_mc-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4hVjNqMD4ACg
 U5xzICb32UUNpb9pAevVCF+x0vlbEDfiJeF44tTVUdS7iN1EDSXFS3/qow6pvvRruoPGaHHEUZ+
 DhUFWd0a/71sqLjepZhPNQL36UbrCNg0AtEmwByRhgA+NcVJQ6v1Q9hLcyVTXfHtwRi9wfy/lg2
 MR/muXBjKXO7ekmIfmxGGyDDB7W5jC7SrDhCGwf4nVBdy0GaycjSBQ+P+5FwyKomeqJ2MhapoDV
 SIbub46/mnzRD31FnldMvq3i6uMVgLOdazC+jc+NGaACxknFvYrJHk8en46U2S7Fmnqknqc2Svr
 zJCH62+apa3r2wFrOfweNHfWsrePNHMN+zTA7U0UwFaok9sZc9gG1uBcjm1vXA7ZzAQQES2+1XH
 0QbX22R/xj4L9FL6Ko50X3AV3z1pVLb/8iHYggWYMyAIortSHYwGZB+B2b5fRY6nHZe6iKoGzwr
 WVtAbMxBjynXZnjxR7g==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ebf9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: cWGBTmjA-S4hYupWbuV47lL2pOL_mc-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

From: Cristian Marussi <cristian.marussi@arm.com>

Driver module auto-loading requires the devices to already be created for
udev to get the necessary uevents based on which udev auto-loads modules.
But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Pre-register the tupples for standard protocols to break this circular
dependency.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Drop adding of a bus uevent function this is already done
- Update comments and commit message with a better explanation of why
- Link to v1/RFC: https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com
---
 drivers/firmware/arm_scmi/bus.c | 47 ++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..111727904a89 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -77,12 +77,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	if (phead) {
 		head = phead;
 		list_for_each_entry(rdev, head, node) {
+			/* pr_debug() because dups are expected for std protocols */
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
-				pr_err("Ignoring duplicate request [%d] %s\n",
-				       rdev->id_table->protocol_id,
-				       rdev->id_table->name);
-				ret = -EINVAL;
-				goto out;
+				pr_debug("Device already requested [%d] %s\n",
+					 rdev->id_table->protocol_id,
+					 rdev->id_table->name);
+				mutex_unlock(&scmi_requested_devices_mtx);
+				return 0;
 			}
 		}
 	}
@@ -579,17 +580,49 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
 static int __init scmi_bus_init(void)
 {
 	int retval;
 
 	retval = bus_register(&scmi_bus_type);
-	if (retval)
+	if (retval) {
 		pr_err("SCMI protocol bus register failed (%d)\n", retval);
+		return retval;
+	}
+
+	/*
+	 * Driver module auto-loading requires the devices to already be created
+	 * for udev to get the necessary uevents. But the devices are only
+	 * created after their { protocol, name } tupples have been registered
+	 * which is done from scmi_driver_register(). Pre-register the tupples
+	 * for known (in tree) drivers to break this circular dependency.
+	 */
+	retval = scmi_protocol_table_register(scmi_std_id_table);
+	if (retval) {
+		bus_unregister(&scmi_bus_type);
+		return retval;
+	}
 
 	pr_info("SCMI protocol bus registered\n");
 
-	return retval;
+	return 0;
 }
 subsys_initcall(scmi_bus_init);
 
-- 
2.55.0

