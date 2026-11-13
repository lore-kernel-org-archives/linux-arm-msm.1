Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538263;
	b=vB89cFduMPrINJa0Fp5VSUHDjoD4cL19Hh0Slls0NIG6BIE1G+mH4FmE0s/YZW8W/1AC
	 Ukz0ZX5eyOi5u2r+Esjhzq9NMja9XseuVFeA8UG592+YRMfWmESXM5Ty4391exltUTnwE
	 HlXvBfsiRz4hocMzVfPMAdhYbFO9ZHGLApAFjLCCVe0yGbzbXkkiCW65g8jrl5mYmUxf0
	 yqU1wGfXsFTGKMcAnsnh+W+mbuhvZzm0PHTOFbcPew8lwrRUVowTCSBMcfX5Y1cqT40CZ
	 CcYQLde4Wv5FBOzkXk1VUiWRKtiWVGnMSl7soI4d8Ttc+149zD1u6ll2BfvhxTPmLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
	b=QyvbGoGJz5Wl1abs2NT1jy7rxOcscAcCFvJJpa5Kyn8wwNRq9d8zKDthpKhhgSCYzFTR
	 xBIi8rsJvwjVWcjXjqFwHWB2lfCRk9vrTMz51bZZxNNZVw8Rfk83MbS+kx/q+mSde93z/
	 VIEdCsBjOYIiqWmatU4ZvHG21xg6JaNsopZOcWLECHKO8f5Q4atftgAlwk/3EIm9JWwVh
	 zWrMRvcOdsCU8aQtvNaoRgc2SxsPlSeFZ/FQJ77jE5LwL36FlbqYj0KBhUtPvTXGYHv+z
	 0AWDMcKKzE1V6xDVUBiWAblPVrgfjpSkTtPB9AOImi1NKJCzdTErAmGGCCSC+SduECg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzQB+uAp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF6606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BF6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzQB+uAp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2JxVV2636350
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KAm4KdCobwm
	m9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=; b=TRm8Iud5RorwuCOokFLouWVyGe3
	Ejs+Jnao3FEeMq/+YD3a7koXGzo7gI15ccwJDb9zzJYZCqWBEdgZJpDIQhrj45tK
	qfrsakbsc95Q7VxRdk+5brGdS/nCTta+FPpd+t6//L/rFTsL96U/A2+wQY5+DdCg
	PR47ghjCkso5U7xQJCz6rVisqqvQMaO6UnEhE57511zAvsCfv09P0rciTjSauNIw
	VRaGkQZN8SMWql4lV1Z+PIzgDLLLr7WSyyT4U1FkuMxgNtgSxwebxXJKcIwxq6Gm
	ma04+sdvrNWNt3RdhoqQXjWaQkeGkYOVS0+ptiYokmNXkCNYjSmZ4BJcvVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4any-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so8400685ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538261; x=1795143061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=KzQB+uAp61609sez6uy/JvVPWDS8t4Q4SCDj9L6voI7GaMrqCeKTSIWWGKuHbDlIyw
         04C2agRt2f3Nk/XSsY7N52KKL1x41LZ6kGbOxNX8RSUfx7wCWqIgIyrswS5K2pOgwZMt
         mAqu9Z8Nd/CHRn3cEXPY6z1oy6aE3obgMFgNAm9Qy/vX9vft2BP1lGdRyGE1atInCKEp
         UuAmaVM/a8XSvl+4uC1HGwVLVQJtCp7aFVDH7lTTIKNy5i/tNYNSDA6Dpe14DLdI3s9D
         myodoZ5/OeEPel1uWGv4Jr5w57F+94sF9FQYPGnVDF1snIJjs9O55dhcGEW/PrYKRXHI
         kOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538261; x=1795143061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=hbN/tqe+jfOipcf3mbzh0xgG6PXlmEshgNkMJl07bgTzj8rwxY1UIQyLs1uBJv55sy
         9sygj+2OdZfzYkw4CzOiEbcy+p2RQeVli6VrBEThtRX87ddmVyw4SmPVYbfd5d7yv1f3
         Fhp8K6PYtCnvbJcMRVIyBd2v2ljF+6CM3taZJsk9QVLIJDRWuIFU9NdRgubJ9EuiFY2u
         ubYQyUoaj25jzqSAjg2U54zTCW2xk06+drmuzEs6gDgM8VjLJ9qlLdxtGi3g/DIq+iLE
         lIr5oC0hKSrcTFHhL4wh4KifIIe2uRhY5Dg4FMqNUFWLtDkWVHK5DK51iXwoxe3qmU6j
         uy/Q==
X-Forwarded-Encrypted: i=1; AL+hErEzwHVFg5u0N9/2BemyGisKqLJa6fgKsu7Mwp1lFgAVmyzBcc2Fyxd/zYK+4bLMtEDQ6+hrwclvqWf86oOU@vger.kernel.org
X-Gm-Message-State: APuU4Z9dQwyLoCZg2zBek4YhMLiqc+GFStMpfofq3n6f3xSfN/NRQgk4
	o2Xp1LI7E9wOQJ86u34eEvezruo7Vts0mU78mdhlXZu5ckQ4ZHuS9DRPNik2ijmyg2EyQT3OppZ
	sl/NLBA1CNT4NplkJ8g3fkqa2mHmP0cgn2l8549DbDihfUWXXqB81FNLkiv4UfRDsoKPk
X-Gm-Gg: AYBFou3hcqEzm2EsoY2qB22qj0FWBzCJikE7itVDZNMbRayXN2gN1KRNET09WJiNW3a
	DX+YE6Z7SXG1oTuq8CbDQ3P4lAIF6gKuWY6kzxoKZvNSszi5i6mas9++ePTS/bZndYHMATcbXW6
	a3fKAW17wd2Sp08d/bQV64BPHsV/MzVhx0i3yuCYhrwF2ff3qdKEqXVNIwtJeu2E5l609B34hkP
	BPA7MhKIcGTRwXxn+NTRqhBK/1TeUbBKMowzXt2fHfSgolM8iqnkEkFSfR1KRc87uXh2iO3whUn
	CTb1KLlCAuo0fE0A7OQ36A7tzsJydm+PD1dXDuFMIDU3z1e1pUDhM8dMZz3PoDC2K2R3i3CIgsp
	POi/Xeeu+73PRZFNKxk1MvNCiIElzQCU4PZqG4hY2a1ot9N2pV9ekWP1mcan9k1RpBRp1DkEBPm
	k499dPKSo=
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376775ad.29.1794538261323;
        Thu, 12 Nov 2026 18:51:01 -0800 (PST)
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376575ad.29.1794538260904;
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 04/10] coresight: Move CORESIGHT_DEVID to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:29 +0800
Message-Id: <20261113024935.3173715-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: _4EJMLhO--sSzGKU8YHyoNpdCfI0cDiI
X-Proofpoint-GUID: _4EJMLhO--sSzGKU8YHyoNpdCfI0cDiI
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af67b16 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=cS2XUTlU7a9WQml4CrUA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX2xX42YwB+u7D
 eaPgJTjsT1m49cSJenHHtCSKp6TqFo4HI8klQAtUk6ZoF6iuDAg06zVymhEIDhDdD9R0afUk+f2
 1CApsBQcT6RcZb36PJ552DInMNvvm9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXxjvtbuCpiX5t
 51DT9T2mxJalCiDWRNKiFrFkINO1E5V+HOXd7gM23AI43sP2fNpAOFgBfTyVfH3xpL/s00akf7f
 Uf0rwNp4J+ihiiKCMmFtqV2xE+E3A905OXuKEXKR6iY21J2YTvoo5XlU967HSwbtK/W7ucBHToU
 VJUj8CUyBNWgQzSDTdf7eXmScTALRz93pT3KI54Q3a2uwGrKZ8W4SoS2r/Wt/EKZ3o7ubijZdx+
 sYSlenRUEiWI6dtFNsGTbZMDoCD0ZTI0ANIVh536fJ2e0zj+rjkLFjVzaF7oxC6dFatwzx/689I
 B56raTMDshrPoJjdXAGFf614Rc+BeDUF77hz5oYg7zl3beSkKTYl5TDgh2dJ+bL5F9W7MBgtOG+
 KZzsBQZ+RDRglKcSvU/+HDJtbeRFdIuI5Y3c1hC4iWdCsvuahBWbN5S2eLJFENwWJccopF8HtSv
 xzNZaUO3ZkYnt+die0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_DEVID lives at a fixed, architecturally-defined offset
(0xfc8) within the generic CoreSight management register block, which
is also present on non-CoreSight-labelled components that follow the
same convention (e.g. the Qualcomm TGU). Keeping it private to
coresight-priv.h forces such drivers to redefine the same constant
under a different name instead of reusing it, as already done for
CORESIGHT_LAR/CS_LOCK/CS_UNLOCK.

Move CORESIGHT_DEVID into the public include/linux/coresight.h so it
can be shared outside of drivers/hwtracing/coresight/ as well.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 1 -
 include/linux/coresight.h                    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 0d3f6229b282..a28b89d43291 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -26,7 +26,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
 #define CORESIGHT_DEVTYPE	0xfcc
 
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 0168f6abffaf..5286b3606581 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -36,6 +36,7 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_DEVID		0xfc8
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1

