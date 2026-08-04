Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296734B8DF5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873523; cv=none; b=QR4QSb0S3wB7t8sw/V15yLgpnNmpzSGKzfZeKB3VhxxKKsZfsTo92TTk7dRZybaLa0KhKSyV2Nb+VnKuWfA+riqZNjOYp6hbzHvGypa6Wphkmd7v3WckQc3NeW4zom0DhpRh/gW+iQw+5EiRU6cT5MM4vskMdVJqA+n4S4filZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873523; c=relaxed/simple;
	bh=aMvXNSriPF/1rdXD7CryP6EsFDq+VBK2UfJSFjESgos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1KFnACv+SDMklD+IZ2VPUN3YHKUx9SBHyvXZep1OwNXyY38qKeLgde0dCfPa8IVYksy7OMMZQ7mn+UJiJSdJYHX9dVgJh1GWTryvfCiE41BGi1apZ9RCnCc26664N8z8SjjMVRv908yCFv/TTH37p0MNSINPgJQfOVdno/kDGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBu/S5ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNEkrDe2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBu/S5ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNEkrDe2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlvMq435325
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 19:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=; b=SBu/S5efX3MKEky9
	WUCMyIcbLHQ1Wxi4IPa9C5jVpH/2lN6Iscbef8UD0c+Ia6yT59SdXrh7vbPkmP9T
	3fI2wQOb7uL2WJKCfw+drjNd5kGSb9M9r7HMcHd1QvW3HLGy10nrD6TPsH7leCe0
	SDYt+HaUhMGUoBHzhUaVFJTaAfNq4ughIIDYw5Yd46iadEsGUqOHu1a80S0SrUUg
	dufvZedyUmj3NPBtBzbSBACwZIYP9ZtrozNMZraYSdmHXHwxzTmgFMEXV5Glz72h
	6X9EwVh6SHi787IYKSH+1YfqLM/tKH1C//O1CabqFKF6auI4BDvR14NxfKDxfaMr
	Alc1zw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568uhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 19:58:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso2575695ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873517; x=1786478317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=;
        b=fNEkrDe2PTtA9O9WnsfBFPO2xwQjcPRgZ0MhmMg3I/U0P6OBP4Ex1bl/HySMsUa2OT
         5KvPX8dH+kxMWIS42gJpu0KhdfKq7ZkV+5du5hts5UrBjG8FdiWYsZqfwGoVVPls+kmM
         m+0/X0GrHlluoE4+T8VxQStBJRY4iS7xem3JKoRdLClmORw8vVdWAuGRhiV4X1Vy1bzH
         3POFWrTDVfkKeU4L8tERt3MsEMmGl20nWB6luSw320mRmi9AJazkesyssjrNp3AQUyGM
         J2GGmiUlh4sA4fPfSiDXhRCrU1AaWKm5SJFEbfnyheTiZEbS9+Ih0u9HIQ2YIP9wT2lU
         M4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873517; x=1786478317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=;
        b=S47bztohANlHv2/evReuCNP4NUCl0S1iVGroy/1X0a+dVrBJFxCFvsBhrFYdfo+sEL
         tFbqSE6EYAUBO+euWLzK0esiut3hwpm9vEXQbMQYb9Ydvvm5vggLvbmr+4VUerF/VTCt
         kYrdB4TXMSwWM7ClX0PUw+oxE6tlVeN+huXjDyzUEypdw45M83u5xJmeiy+fCwGvnMX8
         BvvkrNeauyxH12m+iGY7TPzyXtq5DykIRJ+8tNHlk4MWVTUvY1IE03mPRspZ/1o/vBNg
         E9UONlNewttWyLkC8mxPgv8OWMNKpIUXqQteMK3wnaBlrPQshLWU6hOJ0wzdRlbrDOEv
         wmkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4RYgsXBJDEp17ulilai9DZ+9mLBwhPBbKksKqjbGfLs6+Y9AVVrhT+IGzvXfdLmJaNF/QznU4/x0YJ7M+@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLhTY8DvH3xn75ACDcGXJwDA3+RVIuXV1HJrQrVcGaD4ekL/i
	RL7kDPlq8rKF22+CNYQott2C+07KhHOVvk02cEMPt/eLoX2i4Ibjn5SFTwfNLfm+JSlJgUAG8G3
	lG9ird1sIPQGTQtizYPCwXnls1dEd7qPPYIXMKRUqao0ruldObpF1HuzB8zewdtr1pvcu
X-Gm-Gg: AR+sD12UuVqCSKl6NYeOXAN4B9m29LLEd6ARbtqbrmrFJHDSdvJnc/kHy1yUn5qscz7
	NnEV71Xl9Qs7LoOqFsyZ6Gmj8ckOvq6uBFquF8j36i0vgJx4GCWjFtc+2jF+qteHqCSQgDJSBTE
	vvVbJXeD2/wtVnm4UqUk6TtJZKVyptFfmk8hM3BcrSVdKTMwXoZnuToI6IBup7BiUsm7J7yQYnl
	DCmKUI7Hy2ONeWYahyBUC9z3b3ux9U/6OVjaUPylwhDQxLPn7LlgdR/rwylFbQKpMBhBXtpinw0
	q67aGO90U4uH/Mm2+bJWdQNRsDiy30bBeLd55kCMet95CQv9PbQvGW5nCtV7ya829Iya3VhsDJO
	jU+6piOWqrx2M51mHdcvmw8RwTiyF4YwizQ==
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d0cc930358mr8353795ad.9.1785873516948;
        Tue, 04 Aug 2026 12:58:36 -0700 (PDT)
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d0cc930358mr8353295ad.9.1785873516378;
        Tue, 04 Aug 2026 12:58:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:36 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:43 +0530
Subject: [PATCH 5/7] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-5-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=3943;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=aMvXNSriPF/1rdXD7CryP6EsFDq+VBK2UfJSFjESgos=;
 b=Z7l3NK4ZAErxpmh0xCxi1JAF+UNI5t63aPkBcxlmu10SL/ThlehBSe3n4zPL7NVW7nvmOlOSn
 6kRFgbHJBz6BLCo2NZ91JGbM8nXdnAJbYVOBu3A1vilb2cZqtF1ArL1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX+tDsMy5Ch3ng
 V1FDjbc/W6WGw+mGZddx9QgWfACQSyIjN+ufZ0n3X6sEaL7k+Jn/FDJ8rStlk4skm/CLgE7Y7bh
 +Gg+qUbKIEsm9APDjGHBVm+rhCAR7BSobvQN9U67GZYty1Ln/cwmtb56I0Owo8kxUQ3OBvpkfGf
 OhKDxgPo+FRnbisTjWGTVMP7SyRd33LWyCz++TkBQnEvcdrXM5DHsBx/W1k1ltvgxYEacnabeng
 SaEZX5WuiFh0ODvUiI8lYRnCGDSL4HphDxHDFrJ//AurHrkOWyxZ0x7Csxl0YHjgTky2rBTh8QH
 R+T64mkFa/+ZlE1Q0/UHOIK4qgKCGtyRYk4wunhW/8LJpD6h0Zk7QS3kqE9h2Zjo/Y8qAl3uAi+
 w0wUxT/JRmSZxjjGoxmc9jcJ5iHisENPDnkqMz1tvi2cXMbm5Kob5E81FPUn/uNZkgr9qD1MUFT
 kKOHjfFWVFnm8FRSzFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX3UTOw5Svyx2/
 rcHId8XgcKTDbzsz4rtPqHSRM55gMjBI6Ke9f0SRSStVE0S3eAe3UbW/CFjcBgqQpWZ6wkNY6ah
 6PFWmKv87Jbd2pRcBRhsALbN36rzxh8=
X-Proofpoint-GUID: EUaTHm5R5Y2Gbxd2WWzt1k1ndDKksXbn
X-Proofpoint-ORIG-GUID: EUaTHm5R5Y2Gbxd2WWzt1k1ndDKksXbn
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72446d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161

On the SA8255P platform there is no Linux clock handler for the SE
source clock, so the driver has no way to look up the source clock
index and divider needed to fill the GSI CONFIG0 TRE for a requested
transfer frequency. To work around this, firmware instead exposes the
SE HW supported source clock frequencies as OPPs on the perf domain
device.

geni_se_domain_attach() now populates se->clk_perf_tbl from this OPP
table at attach time, mirroring clk_perf_tbl on the Linux-clock-managed
path. This lets get_spi_clk_cfg() call geni_se_clk_freq_match() to pick
the closest supported source clock frequency and divider on SA8255P
exactly as it already does when a Linux clock is present, and fill in
the GSI CONFIG0 TRE accordingly.

Switch get_spi_clk_cfg() and spi_geni_runtime_resume() from calling
dev_pm_opp_set_rate() directly to the new geni_se_set_rate() helper, so
the matched frequency is applied to the correct device (the perf
domain device on the firmware managed path, or se->dev otherwise)
without the SPI driver needing to know which resources_init variant is
in use.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6566975eb24f..09e796d22ab1 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -15,7 +15,6 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/geni-se.h>
@@ -82,7 +81,6 @@
 
 struct geni_spi_desc {
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -150,9 +148,9 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 
 	dev_dbg(mas->dev, "req %u=>%u sclk %lu, idx %d, div %d\n", speed_hz,
 				actual_hz, sclk_freq, *clk_idx, *clk_div);
-	ret = dev_pm_opp_set_rate(mas->dev, sclk_freq);
+	ret = geni_se_set_rate(&mas->se, sclk_freq);
 	if (ret)
-		dev_err(mas->dev, "dev_pm_opp_set_rate failed %d\n", ret);
+		dev_err(mas->dev, "geni_se_set_rate failed %d\n", ret);
 	else
 		mas->cur_sclk_hz = sclk_freq;
 
@@ -847,7 +845,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
+	ret = geni_spi_set_clock_and_bw(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1162,6 +1160,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
+	geni_se_set_rate(&mas->se, 0);
+
 	return mas->dev_data->power_off ?
 	       mas->dev_data->power_off(&mas->se) : 0;
 }
@@ -1178,10 +1178,7 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (mas->se.has_opp)
-		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
-
-	return 0;
+	return geni_se_set_rate(&mas->se, mas->cur_sclk_hz);
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)
@@ -1224,14 +1221,12 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 
 static const struct geni_spi_desc geni_spi = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_spi_set_clock_and_bw,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_spi_desc sa8255p_geni_spi = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id spi_geni_dt_match[] = {

-- 
2.34.1

