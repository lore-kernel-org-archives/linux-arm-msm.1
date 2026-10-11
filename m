Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C244C670
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723792; cv=none; b=okEphf199egxN9siVsibWare4GYTRTiYD56ZMMgNpX+rEmeYKhf2+NJoBoiSMu2A2f6xousfkRShc8uTAq/TwdgCz06qBI9QI2ODNxAZlMsD340HlNqJzJSBk9AG3hlJ+h9WT98ABLE+9FJGnDxN1bWoX5URazRk7HPCNiZwuNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723792; c=relaxed/simple;
	bh=DQ4y28eGLfNUnBCfGLtzxpZcdDVJRqiPI/Z0z/K/H7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUJr2gOS34FGAvNz2aPcKQLiUAZ7C2f6b1G5FE3l2wt/6U22LLEXvVnp4eACX7bEWb5mUSYq9AwsV+U2LcAHEhBmfzhQxpkxyAPs2Egp0PmV41fUTV8Y73yhVV+c3zKSNPLIHn3yZvLRVO9jlU1hPQIDXeTrAMpUhbd+x8yIKlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYNsOtCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZT1z85o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYNsOtCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZT1z85o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B8577W2381417
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXsP313O9s2aoJELkjK5RdP54j8WZOzAGDmYM24LCcY=; b=eYNsOtCcqvyRCaQJ
	BpjVu4j6DVUdw/f8Di9rOf0NBlrzZTGY2Rkr/ex5Nwns29avpv3KlvEOdkHs/ZOZ
	ZyI2UuADk0XRKEttVPIhhyoL0b2bbyBOzrjEjkmKCzkPjB1ZwTpoKo5oYhymXlZg
	di/7HmMg2+K6QWRaFJl7RYw5XaVeTXzXXnDyXffiflSqWQV8JcYml1T0XcbtWST9
	PbcIvyjunlt7a57e7BS+uRbfIeUC1b+W4tsZdj8oj4bCtR9K0JkAJ9qNwKH7x+eb
	eEeDadlR/YRo/eLXWhatoJj8f4hWcCudcb4VSzDXfeuQjfa5n/kCKoj+eU2/J1Wv
	5DXgvg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eaw8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso602254eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723786; x=1792328586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXsP313O9s2aoJELkjK5RdP54j8WZOzAGDmYM24LCcY=;
        b=bZT1z85o+OW0kghLtztmjCuTYdLXzKu5/nLYCLJn93wDZJhZIi/nmQwGRyTerE7oCz
         BNOjB+GXSfl04+DbULJEa16i0FX6yf5VI70AI3bLpHq3NVShrqsiZSEZx3sW/E+ioQfs
         aKHsQzD3Ur4kSKsuS6/rER5DowNc5x5idg5JaDQUyw+Ofp4btM2xdqdV8VVgEKAfdeNA
         bs6Y2iQ/LsEXoSBOTo98JNh182HonYDroCyZUtA4FtqncZEka2qry56NFs2SRM4XfEoO
         Sz8W7vthUqNmzebRZ/avqeVFsK05rYjDy3hvaQ6owT9OAe80TNDfmj0Ku/0iC3prStKT
         RPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723786; x=1792328586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXsP313O9s2aoJELkjK5RdP54j8WZOzAGDmYM24LCcY=;
        b=wyEFY7ey11up9jmzJcKChdQ3Jzszd9JWenGyOHWS5jEawabJp0rjJLwLGzO50uSJiE
         gKYxesGS73OTqK5llUxfB/AICe9rP4BAA5VbXmUGbIzbVfmuVB0jYyU335PEA1pMLcYG
         gjecEz/JveI5KZEBJN6GcTAEvA/HwXKBe+0fMLlZiXhUPSkqMdr0Fdr5s4cPCmtA+jak
         sTHno2HVMbO9YweyV+SqQT8MPQ6aFPgv/sik1ZCD1IKt1zBC/M1tmEHWYAuzz5hJfbrk
         UyJfcy26IKZfculfqQrAdFHP21ufsm2bDFBZqFVr9iMFvDsEvKb9WWO7re3iIe2qwzNu
         awVw==
X-Forwarded-Encrypted: i=1; AKwUvByilMH9rWvPOA/tbSTWkTGek6IvGGLcixrG+oNmiuJPEzJOtTJJ3xmdzFsAw61qs+XHwsbSMsIiSoiYtZu6@vger.kernel.org
X-Gm-Message-State: AFq9FYK7OQP1neWN84RMUZKf0Bj+6Ezxu52uf+CNVY/HcP2e8AYZ6pCP
	U25k+5TfsbflI9TM6SKuobfspBouCN0xToToQuW4zYoZr2ZuY4ovejrE6U+v2e84nFNPt67rKQO
	l04HcD3Dx///ll7uD87Q8GuzbLjxkM4vUvtJOoZx8GiZl8OA+iWcz47P5/rs7TaXJBiuJ
X-Gm-Gg: AYBFou1Idzv0XYl89CvfldZblfkI00LqyzAk0NgcyfaJ1SWESEBoAuWl8bCdflbsKa1
	CFtuV11ViM5dBhowHm7BdHJnwc/hQpUZzyQzpybucyc3jxFmrsOCQr4LJwCr31hxuX1QqSqhHFB
	UF2QPahb7lVQOoA+Ql/vLFvdYD96j30r9N9gZh1XU9lcp3zQZWOHMQDPIGgcKMGD99uUY2bcVK4
	C3FtNlRFFbCgvWZxmTXau6zAB/EN7BEHRHF5DANpp5LAVMduXUZsnNKCsmVCNtzQ14EBoLMq51N
	yg3ih8peQTHcT8lhiTmxlRiCI6av+cZ+2Xix/8OASz6yr+t0GMoH3uu2D8zjxIRRdSVVpoizRFe
	hph7mWKzZnOMJknPqDE+GtPtaMswAv8axuXfXiqobK9I=
X-Received: by 2002:a05:693c:414b:20b0:33e:a0c3:4163 with SMTP id 5a478bee46e88-3537e00907amr10561327eec.24.1791723786100;
        Sun, 11 Oct 2026 06:03:06 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:20b0:33e:a0c3:4163 with SMTP id 5a478bee46e88-3537e00907amr10561272eec.24.1791723785495;
        Sun, 11 Oct 2026 06:03:05 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:05 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:08 -0700
Subject: [PATCH net-next v2 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table access
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-2-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=1989;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=DQ4y28eGLfNUnBCfGLtzxpZcdDVJRqiPI/Z0z/K/H7U=;
 b=iTWDL7umjdAppcqNyWAzbufRcYaX0hIXJsODphFrJ/uEQZ46m9Wv6pdVSlHteNXMrDkA5+jfg
 If8Kp3LdzVWCiFF18pmUMuMNwwUhwtscdD+H+rZNhoVcmkgec+CNVrJ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX31iINMVdGKzn
 WPq2+1lf1fXCTfkU52KCmC8OIed8rR3y1e3C4xCnuonftGk8qjghsCVV4sbEHmcZjfnC7JF1nqJ
 Koyu1j0dEOV8CTcnEGZ5tgxRFLtD/kdQz5Dg3w0/49mArx7ZR3JxVYpSCIw7VOCTRKheKb/3cA1
 4DLXIW9t8R9nvg71aljgr8OZSF/gb4xBL8ah2QPu1QNnTRLl9qAz1ctewgYlbIgTaOGwzmh7DM0
 nDe63WRKuIDlrnOxdziQ7M/oIRT2bPv2YmkED5E+FMfzSLXkdqbiva4P0YX/g+oPVWhKinS64uR
 4Z5TBK1yTvT4pd4CoeJfpfHGyd3mzn7+hFiUCspvpSoAWbhKlPCDRiflDS+EfiKhm6OyJEwh/5c
 febPzUTEvv9AI4qP5ZcwhT4wzwSKrNJtBsaH3f4lTiaIAW/qNCrmSavPfLZ7YViyEx8z3zkDXiR
 /WQO8vRirB3FNMGep8Q==
X-Proofpoint-ORIG-GUID: oNwXyvklNwv1CpSNxbEsra_y-HpOquxE
X-Proofpoint-GUID: oNwXyvklNwv1CpSNxbEsra_y-HpOquxE
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acb890a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eEuoQyLnUp-QdWxJuLgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX2AbF7Cjg2miH
 LUwkB3EKYKsRi4ncEOGwOoP3Ex/bD02sDdEQ8QEMAgpGG44Kj6Xg7A2/aJGolsGiDRhNFvoT1gJ
 8o5nMzgGTHlCLcLveEpcpWfKI4IBYu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

PPE queues 0-255 are unicast queues and queues from 256 onwards are
multicast queues. The multicast queue configuration table has its own
index, starting from 0 for the first multicast queue, and each entry
has 3 words.

The driver uses the absolute queue ID as the index of this table, which
is out of range for every multicast queue. As a result, the multicast
queue thresholds are never configured, and unrelated QM registers are
written instead. The driver also accesses 5 words per entry instead
of 3.

Fix it by converting the queue ID to the index of the multicast queue
configuration table and accessing only the 3 words of the entry.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 125b73be92b1..2f4f59280647 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1474,7 +1474,7 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
 {
 	const struct ppe_qm_queue_config *queue_cfg;
 	int ret, i, queue_id, queue_cfg_count;
-	u32 reg, multicast_queue_cfg[5];
+	u32 reg, multicast_queue_cfg[3];
 	u32 unicast_queue_cfg[4];
 	u32 group_cfg[3];
 
@@ -1530,8 +1530,13 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
 				if (ret)
 					goto qm_config_fail;
 			} else {
+				/* The multicast queue table is indexed from 0 for
+				 * the first multicast queue, which follows the
+				 * unicast queues.
+				 */
 				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
-				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
+				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC *
+				      (queue_id - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES);
 
 				ret = regmap_bulk_read(ppe_dev->regmap, reg,
 						       multicast_queue_cfg,

-- 
2.43.0

