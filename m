Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210336;
	b=WkZbu240oWbf3jepQjKNb97zEsNe4EN4De6A02Ch8p2AYUh5uYFhmp53FsZeOXPU/AJX
	 PquuwFwLgm67hB815hvfx9rYy3EtVlodxuoqDANULyqPZzmmDx8ZCyjFB3UbsMQ9QMCzM
	 uB2UVe51hkdw1UAnU9AGSOuckWmiPIz5YsX4Tw1MmkkmXg5bcRdlH5q5Nt0aamdVTaF93
	 R9MPSkCo4ceUsjJLDy90YHLTboxrUGi41dXh7PMnaiKYkab0pJoKLPHI6M2KvdjClhJmV
	 K8rIBNE6ZUh0RhjdGbhHgQqG7SfZsRFDYvoQVVXAtQLh4+i+zvruTL5T6ZtgOgql5kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xzpm2z6L7dZsSu404qNFqb/ioQVfKeeGQLxFc5PxE8w=;
	b=MQflNqrg6WwklEdQw38UN8tBuvZZyiZa4RyesKGYejOo6l4XRTx0uCz2O/KBUVQS/Crl
	 YTbFE+oGTgbomtt2CLJps17n180l5FoHltGDjpfq8Sz4DKYVEjbBvxSN+4/NAj1oQGaJd
	 xREe+32gdPUzlhzeIWJBDlxUj+SU92+e9rJpZj+/TbGeFs5ZDAea8LWAp9bqoUoSpiJOV
	 aqi3IdUBVfSDUT4dHyKaHaxjWy38cXcKlLpp3Mt6sds8hpWNQFW3miS5TT//nznBtmoaW
	 jeC4AGg3NUVjZriDePaFP48ofDCtXw3O0q726F+O2HBwd5tRpLt0CqDpnKhHxtPl1yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SVn7P587;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbijSiWy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7E606A698
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 21:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F7E606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SVn7P587;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbijSiWy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFxf43830560
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 21:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xzpm2z6L7dZsSu404qNFqb
	/ioQVfKeeGQLxFc5PxE8w=; b=SVn7P587cXNyrZnr8vc4iCEc5E4xV3dpdg8/TR
	zE9RSWriMMuvIYPrbzNs/gx1Fbv1APBvWAffzSUzFnn1MGjqpSOZFdEgTMVka8LF
	W7ldFEiEIU1EBQr+0+lETbtBEYIgcyK0ZSSS6PT5DBWZ1UjlXXKK9p2T14YEHhh/
	WHT1MbWJQ/+AQosV7c+Qculve2jzPJb28+Kzy3MmJmvdiuVDGPhhTW7jloQEB5zl
	IFPO6CKVjKYE/tWSaNWiMBeCLCicVC4SLE5OwjLyciTbk2uE8FK2lqIZY6LQc7DK
	uQ4RcXzzA9Em7zZvLUmzfXuvhKl1zdJB13JPAI2StLC0378g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwh90n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 21:32:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2316880eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795210331; x=1795815131; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xzpm2z6L7dZsSu404qNFqb/ioQVfKeeGQLxFc5PxE8w=;
        b=kbijSiWydFo6RmyY4+7ubXVlZ/LQv/n8qkSfrOmzM/QSZe5ch67A5t0j+2SIc1JRak
         9XBUHnh2qjsWxH0gjd/B/xsNWrAReonzLnhHx2KSvrMVa/1UkNeE9wIH4ooEVBKxncNJ
         UJzm9+XQiVtk5tSjLK91lTqZE+1xz+hnkfZaoxzCqSp7TV/7e4cxZG4QGzo31trLq+B+
         sa0aqcqC+vqBDO75pNaI/2XhHGUrnp0faP0VekhRYCysmflrMml/K8FqFfLDQF7Pe6wn
         IQ8yR4iUdvEu7jAfMDXrFyAuKAw1WQyzzM7HCb+oZRt+tw5CBdLWRrWKQIm9LdMSw4bf
         NWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210331; x=1795815131;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xzpm2z6L7dZsSu404qNFqb/ioQVfKeeGQLxFc5PxE8w=;
        b=dRRt06CGFRDbWDEXXkGXcg2WJkhzTQrwxbTVxy3frouTtE+abEDqGoayTB9zbQsyRo
         AOn4P7c59NVbYCB/3bqNRgTGSHn/cvjcXSAYGmXDBl/MVQr02D9I1Cj1EvIA7HuruSt+
         7u3fWAmM5S9QdfGtdCSo6nt3ANb5FiUkC38KKZg+J8bgtkYkqDSNuaMiEQFshrUjOGkL
         YXddBYAbex7SxTITzPAKWqK75ZnRUSuVMG+duYggX0N/gms7ENWFE8r4XHSOX2lSb/bF
         PdNp5M2+h0KO6eyBef5JW1PO1zbCRw0JDY736jRoRjwPJdibbTG1vvdguoEfocdBnbAt
         xAzQ==
X-Gm-Message-State: APuU4Z+pvb4GjXcih16O56HnOUgnfFJ7dSdtKzaFvESVu36HeZfMT71B
	ql5uPdYBmUPP+5X1KlEl+iiMJkmqGxz5IOe7W6jASkhUbaOoWhWQeUMdX9g1V8/ol1qDnKacSM6
	DzWEkm+zRh0nrEx4ehffTx5lz9GB9aBCgaqXNcwUkqfuF2Km+2UmBWMaXWDlE3Mkjq9nWc7uODf
	fQ
X-Gm-Gg: AZFdTZc0ecRqhGvZerwLuBp5lqOpNl4YWgFjbmrndsAwqPL2yNyf1LtdXrg7Drzgh1o
	OCdL+teNPcRlu8ALGulDyfFwXcBtc1qxgXNJOm0AalHpJWrb8lKE8ikSbwKJl8TtqpvkjR6u7qn
	iLjoOiadV89+BwRVuSWMpxfgiHtaYPi2KccW2mVxD9WS/R4EJaQnb0sk7H542+j52LDgB6QP+pz
	KKxPBTVfrhXKJg/FUIRVebikTLUANzLPdgHKefCtTzMnmWwaNaaZen6pcX1SaZgZwcqbzBp8JVk
	Zh9F/bHXPXJuVWVfC/Z8oHpQFd2eCKHopa17VgMR1VOYGVN8bIQ1Eqg6v9WTaa6th+zAQaabPYz
	O65JkaQLDiWnNSZkaj+HCYigWPpTpuYs95ju6fpOSfdGcDTIgldFzWsb40q1kCFXO1isgVjeghY
	FYxL0=
X-Received: by 2002:a05:693c:8390:10b0:36e:d060:8bad with SMTP id 5a478bee46e88-3856c6b3245mr4756791eec.5.1795210330841;
        Fri, 20 Nov 2026 13:32:10 -0800 (PST)
X-Received: by 2002:a05:693c:8390:10b0:36e:d060:8bad with SMTP id 5a478bee46e88-3856c6b3245mr4756752eec.5.1795210330151;
        Fri, 20 Nov 2026 13:32:10 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm11835823eec.27.2026.11.20.13.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:32:09 -0800 (PST)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 03:02:03 +0530
Subject: [PATCH] power: supply: qcom_battmgr: stop faking battery presence
 on Glymur & X1E80100
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
Message-Id: <20261121-batt-pres-fix-v1-1-2e8b2cc98a1e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFK8AGsC/yWMywqFMAwFf0WyNtAWH+CviAtro8aFSlMvF8R/N
 +pyzmHmBKHIJNBkJ0T6sfC2Ktg8g2Hu14mQgzI44yprnUXfp4R7JMGR/1iUJvhgaleRAXX00Pn
 ttd3HcviFhvRE4Lpu1axZtXEAAAA=
X-Change-ID: 20261121-batt-pres-fix-450dbd0726e0
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795210327; l=2490;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=ylNZO6rrYLLTGFaV+qJMzyVRtyvwQw/83v2XgUo/esY=;
 b=ktEQXFZQhwCwXOSm4LKFsep+aywjydLx/TZ636AwCB86flNgPKr2jNwfL3rwyfBYwkOPZ3v8q
 II8HMDZL1UcCzlG4rtTdbpbAXwjcb0m6LVE87d4Gqn9+zyFOHWHs5pu
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: Fv7oltdOV_nVEQsPbWwYBiGTO4oyH80k
X-Proofpoint-GUID: Fv7oltdOV_nVEQsPbWwYBiGTO4oyH80k
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00bc5c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=infQlCuWzlnsuc6jWUEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4NSBTYWx0ZWRfX3GV+d/NUsRUF
 IcGFsqqlX/Qwq/aGA/WP61W70FYomjsio8/jH62/245jR8q36ERzahyMRsHBVqjZX99WCcdXtLS
 71MmfdUt5K0krYytV4BlakMTpXuIDNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4NSBTYWx0ZWRfX9akvHD7h6co7
 vnFNBZluCZM3liWJQ/4AvuAAWBkQaGXaCOKk+F/qAxd5TXUX6vwe+uNE1QRuOI7xNsHnfx4FsgA
 qgIMhxrj7e+cdsWPpVmXUrM7Uy85psc4ulm1oakLqeg9/GqjhMCwFFGzYMzjNbe4zauKNvs6Dl+
 JPohNlcuFe1jf0lgf1fYyOOIDYmd6Rg14XXJ9y6/urDso8wFfrG1Q8Avlx8zB1lJu9fYe6UotJf
 537VgFdMCVFwiqC1Von04iVBGEPUVvikdbrvGOT08l5PIAav9/QwmxP1IiW2MP+THfCKJmzKa1Z
 qXBm9eCUmTMgHKP5vdzMQngywZnMpKFm/AB+J/gu5Dvf1kio94n3QaZ5pJ1WxGrwZQbY4z42FdW
 F/zBt/mJj6Qb3giAH4iqecpKwB6wfHBY7IJvGWHk/hcSQBLI3f8eeKb+V5YQ2gcxZgtAn6b1cok
 7JAWTJz1y+QqPB1jPfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200085

From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

The qcom_battmgr driver unconditionally reports the battery as present for
Glymur and X1E80100 variants, even if the battery is actually removed.

Fix this by fetching the BATT_PRESENT property via the
BATTMGR_BAT_PROPERTY_GET opcode from battery firmware. While continue
assuming the battery is present for SC8280XP platforms.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/power/supply/qcom_battmgr.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 69473ea753f6..a5262a7e8836 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -557,6 +557,7 @@ static int qcom_battmgr_bat_sc8280xp_update(struct qcom_battmgr *battmgr,
 					    enum power_supply_property psp)
 {
 	int ret;
+	unsigned int prop;
 
 	mutex_lock(&battmgr->lock);
 
@@ -587,6 +588,12 @@ static int qcom_battmgr_bat_sc8280xp_update(struct qcom_battmgr *battmgr,
 		}
 	}
 
+	if (battmgr->variant == QCOM_BATTMGR_X1E80100 &&
+	    psp == POWER_SUPPLY_PROP_PRESENT) {
+		prop = sm8350_bat_prop_map[POWER_SUPPLY_PROP_PRESENT];
+		ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET, prop, 0);
+	}
+
 out_unlock:
 	mutex_unlock(&battmgr->lock);
 	return ret;
@@ -1422,7 +1429,8 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
 
 		battmgr->unit = le32_to_cpu(resp->info.power_unit);
 
-		battmgr->info.present = true;
+		if (battmgr->variant != QCOM_BATTMGR_X1E80100)
+			battmgr->info.present = true;
 		battmgr->info.design_capacity = le32_to_cpu(resp->info.design_capacity) * 1000;
 		battmgr->info.last_full_capacity = le32_to_cpu(resp->info.last_full_capacity) * 1000;
 		battmgr->info.voltage_max_design = le32_to_cpu(resp->info.design_voltage) * 1000;
@@ -1500,6 +1508,9 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
 	case BATTMGR_CHG_CTRL_LIMIT_EN:
 		battmgr->error = 0;
 		break;
+	case BATTMGR_BAT_PROPERTY_GET:
+		battmgr->info.present = le32_to_cpu(resp->intval.value);
+		break;
 	default:
 		dev_warn(battmgr->dev, "unknown message %#x\n", opcode);
 		break;

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261121-batt-pres-fix-450dbd0726e0

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

