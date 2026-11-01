Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564668;
	b=SGP7t6olT6ylzJwKEkquMcOAqe3C5Pk0hZgquODJLT9HFXrwU0NU6CHeFQclHfmVOb4h
	 bWBy72knwPe70th7wjHLC93Yowsv6GP/vqOa4gLTWH0LHIs5kkSdlkpBitCsSwTz8nVA6
	 eUugQYKBq7gIY9atQ/z0Z3VqSweQeSAkCSPQImC1jyg3Zh1ZS4MgAAD6ewJuEa1WWrygm
	 MC6/mZIpUY2T5ikXdjyAqOgsUNiEu3014yF0EXWHxpt4C04hCTnHmgHXudc8pEtdemTJw
	 nQHbgvMYdaRdaQYLlrSOdKz80ZfH9KsdmQouCd+0Ab2N1T6H2chVvPWOTLb/V6KVwCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BN36EzrJIxm0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=;
	b=Tvlb4CNbrRfr9XUDC0/MMHF2Dn0rb/vziy5It8e9NDANkIoB4sqBMsLH2TRILwVaFYaQ
	 22Hy4KfEbXPmprQE8/ryuA8VbK3p9XN1ueovYf2mxFrELagKsKKIsCGWkw8xUgB+eNnO6
	 +IxO5ytqxJm/De0SZ+WqfwIHymgwVYIJARAVOp64sdwSDF8BDbxvA6IJp8cQ8plHSyuJa
	 oR+Di3PncnUqumZsV1ZXRdVjFueO+gIUTpXfPeQ9TA0+BrjccnMUK/OV2oVth12FMT4a7
	 OgTrUFovOiWWlhLY2ZaNqT/YQFgKdytgyX+TCiwrfqtwMaGRs2H8yMpUirvMynRMG9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPZoGfiG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2afyjV1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B07606A333
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 20:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B07606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPZoGfiG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2afyjV1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK3gG1454042
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 20:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BN36EzrJIxm
	0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=; b=EPZoGfiGKVuM5qwPwgq4MgM+XNI
	ofryv1Ef5/gFgFsG14n0C/7B4ae469OsjcgZjhPyH3V1vFjTp8IRmp2s2+xqVrBP
	REUifM2Jv0MtwLHMOOh8rajHciJTTWoa23Dduxhl5s395M/m4qaGETeEy7IF5Xrp
	rFHJsdEEEjudLH9Jn9hCyy8z6kNzHm/KqNayx+g8K1WBdVNaUYvhE9+c85qAJaRw
	Z9KTgVd9dvuqT4qBFv+0pLG/TYnEvloSZ9i/dKhZq5UhU/hCrWTbsPt7nFYcue9q
	1W6d4Dv7i8UFGUh8qRv1+rBbr4GoiSfv378jic8y2WntFAySKEkjA+pz4Jg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfv896-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 20:24:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so494256385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 12:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793564661; x=1794169461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BN36EzrJIxm0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=;
        b=R2afyjV118vIypOB8GcPNYDmCChBRYoQ6fdOSaagFffVE1bbM66CcjXpIfaqugZPTO
         CEnpR3/i6t/5eELCHFiZNNy/vvZyhM59bb/YlfEbVnwsFQNUsTc0uuBffKUv8OjFYZfd
         N6DeYX71X5Zm5Erm7QoUvp1V36+zQv3HiDQ6dwggP0OlUjWRWniiFG5brcdnQzNVfG0a
         Nq3IEObtb8w1PCbSF94zdRlpsMMKJJ7O6WtNfM5qGP+40gBcabUlDqVLZknlufkyWpWg
         6hvQ7x2fTgx4JwOdyfX9Z7boUWfv0wUD8YmPY8XnkssfHj8waeXWaYQLV/crMt76cgES
         tpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564661; x=1794169461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BN36EzrJIxm0RpLbiUbzeJOidynJLSpvyB8uWqyAP7o=;
        b=V/s3HV2QKjIb5Qj2Ub43IAvbPXjGdiJA949Ha7XyYItfJxX+bJubNP9bhuo+Te6BAw
         jS+aSUiqUhwZpxmflDSrMnYzMVVTj6zPV60bZPDNDISJsyj4dd0acFLrP8SiWql7nGYx
         1Fo74EMKLYqxA1W0wwDDZlKMhtu1c1CxzUoCjtmL/PZyhuQGLYubJ15t/ImHH8eUAgHh
         Zeaiu4uHpAADF8p1bYLsuzljO29scski9gqeaCNdXxiRnSPyzR7l88qUoj+KMB5jfiai
         VXE3kJtMd78uR/CTWkewkUnnO0tVotkGtzAw7EVmOqA1yhgpRfyFL28uIo8bTVwkLKVz
         XGLg==
X-Forwarded-Encrypted: i=1; AKwUvBxJz53fFyhNJVxB6V6rQ+Q+E/2GZZYlCHyq8f8JaSdJIAmCzb3ssdDwbLvwvn1iM+0pQBYLWlFhd125Ob1v@vger.kernel.org
X-Gm-Message-State: AFq9FYIF1BPyewSr/rtoRZMc8tOpIrc+fL5BBcgsvahVAPYr23wllHWu
	v4wzX9CbBOz4P8BbyNzXJHrAaZTu1SBsh42Yzt7/r9L0oQMAX+SMtQZl4XFtV7lQM1edQCu1l4l
	CDndDj1GndzOVB8lFohOG1smT/heUnLkPR7VozXZHjrYsGuO0qDBKCtZtla3j5bBraayU6xZy8P
	35
X-Gm-Gg: AYBFou01bjIG5eV0S3okFX3knpYXFPK6kcKy5sKUI4oiPGCEwuVgnpNYpxibM6kZsk5
	IeS/IQGsYtiIbSPh9mgBrrxmfmDwMCuBO/dyQ390mJGkjmPNNId2MFlqLfHNdZlIZi/rz7sGnNl
	d3bL00B7B+BiQc3+y6k+BtJfabwAFvss06uBK+fQh6bT8s+v7o5pGLyLvTBaUhFDPsi98xaxxC/
	BsSXshn3LoS0ewGJs566b9kv6GdKQIDoV9h6cXXfN29oJuW9+hpK64gDznAKJb/WJQ4uGo5ZhbE
	yZRC/WNO0B99fgyYAzOCWIEJMtT/oMTEZvUPLv/WsCqUnes5dQjHY3SrIpCO0HNXTFI5Q4XyC8i
	rgeG2lQeVMWmfF2ERsyGUgB6oL139Da1Mde9k2rLM4A0vYahRJO7eY8UjRkglsg==
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1314585085a.1.1793564660699;
        Sun, 01 Nov 2026 12:24:20 -0800 (PST)
X-Received: by 2002:a05:620a:2795:b0:93c:c538:2b23 with SMTP id af79cd13be357-9442156a038mr1314582885a.1.1793564660178;
        Sun, 01 Nov 2026 12:24:20 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm16796675f8f.52.2026.11.01.12.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:24:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 2/3] soc: qcom: smp2p: Fix out-of-bounds with incorrect DTB of too many outbound entries
Date: Sun,  1 Nov 2026 21:24:06 +0100
Message-ID: <20261101202404.156522-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WdISjf2NXOI+jjWzEjpgNs4nXLCjUS3m6VKS68MzI8Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq55/lc6UBqMjQ2dRfBG+z7dddlgUqjDhQIF1n+
 g/0dEkWPeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauef5QAKCRDBN2bmhouD
 11llD/47815t6bq0RYdIVHpfpCVLKTLjM3aKQbrfwNw/9OWtNZ0Tk//Tx9T4MQApA00RpDnMGLf
 4Xm1Do1vhQTUW/9CJBNJxCMVIDjqRsJxsm5eSjsVQOoslzF0VcE/uo/G9cPy9ghZrqW/dLv2vNq
 P3VfPljCDCR3XX5rvBh3mnx74vO0f6EayW4kKHGJgYQMCnSa4Oprz6WPo5NPf6KfN5YxoDA6/UE
 qJFtXavk81Kk3xGDJIs+K1Gz1/E08L2MScvZ1cveFCpt5+p/4AUP2R02Bw3ROPLb4r0J9ZGrruT
 WS6LP4UDRUsb2hrD4AvUocA0wNAkA2wlSDMMSZbJH+rZap3qHKp5OsP2bVl4n+s0if4bqMUrOgD
 eqvX3SrREAmB5Y+O+vPzlOm3WqeUqnA72GV5OHXmS9KKyM3+/wID3/jInLGKrHQ5l59aDxeWBok
 kSRe74E+N0e4q+b6cnelxL2SazNaZ4V1ICAE+S0r6L2Hh4/oKQFxFaPrnVD8hufPjEdhYCpi5li
 iQo0DESBWlzxtpWQ5mCGY5WGkw/BVUt4VOEZfdBzQGhfgorO15bkixIWCOH7Nj2DTzqcEwLN84z
 2AS9Nu3un0HgWRSYCXy8z7dscUrV4EFAWcylQKwY4mq05gfucP4zI2ZITlfoPZO74Lz9jqO4cTp 3XYRBfrlhDo+Z5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfX19FGvA5hdeQh
 ZLMrZBnFYTMD/g1LsDE4WFbrvv+yR8uYuwyolwO1MiJA4gMZlVS9kC3rrw/t5Cpta37oa0JNgkw
 fRd9wCkk7coqqbHEkRy4OgKriLYHcCo=
X-Proofpoint-GUID: 1KznBB68mUxkPyHj-Xa8FGseumUBWE1w
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae79ff5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lFa8o7j6PwDw3F3-yxEA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 1KznBB68mUxkPyHj-Xa8FGseumUBWE1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfX03EeMiigjK7S
 Aa9Mi9dIYLGcnzsYi874pk1WtnfcGvVPa3g+c1o7eI3GRjJDhq5B1xPx6I/EWHJV7UCTtoiyHJn
 sTIzgChn7zWAKtyBWNrbAiQFFlZM/TmVI9weYhSmfyX91MXkvNd/IPJzACBiymKsqfFDKciRhqi
 d7k66VILLbgQ60OCxWp3XFSpT2Jbojr5XxPlF5msehYmO2Osx4id5nsYtN5JGBfirBs8I23R5Ky
 e61F0x4Sr/K0aOREjD1tR7qammJl0SmEV2G0yFtOdgfGTWVlCbleixRPXxCs8Jw0AO0CEyOJSVv
 60CPthfoxRq31p76l9F7xE33niPAPu8QJSw+HNoeBIjbYNrDe8A+4Oc1fJYe/ChisKlso6mAcua
 YqQ4olpfn2O1OPeJL7qXmw+y3Ws+M3Wh21M8ggi5B+IeKI0rzWqbcSiOPtZBIlHOU0qvb7LczqB
 +DvKOy/v40a+rE3E9zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010081

The outbound SMEM item has a fixed array of SMP2P_MAX_ENTRY (16)
entries, thus driver should be sure that DTB does not have more of
these, otherwise such incorrect DTB would cause out-of-bounds writes.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-eaf9beb4-cc0d-4d8e-be28-4c12b039b3c8
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 7c1684c65e3b..784a164cf367 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -517,6 +517,11 @@ static int qcom_smp2p_outbound_entry(struct qcom_smp2p *smp2p,
 	struct smp2p_smem_item *out = smp2p->out;
 	char buf[SMP2P_MAX_ENTRY_NAME] = {};
 
+	if (out->valid_entries >= SMP2P_MAX_ENTRY) {
+		dev_err(smp2p->dev, "too many outbound entries\n");
+		return -EINVAL;
+	}
+
 	/* Allocate an entry from the smem item */
 	strscpy(buf, entry->name, SMP2P_MAX_ENTRY_NAME);
 	memcpy(out->entries[out->valid_entries].name, buf, SMP2P_MAX_ENTRY_NAME);
-- 
2.53.0

