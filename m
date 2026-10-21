Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597434;
	b=VTvUFthNpzynpjfInF4AozXN2ckv4j5Mz6hIP4Ydg7pbTYPZoJnKIaAX2+rCdOMbwrsP
	 1IV25k1r5nlqwRmJWmpAuHZOKB3Jhe0CXVed7z49HA6EufnBitl2nZsrHD4o/VXP1xmV9
	 KHqA/kF6BfgY3mIEEdUOB6f0CaO/KBvgCio41iOyBpedgIxYF9qVBxsbx5JwI2BWT6afy
	 lY5niq7sNcW44N0JukGcouK1D6tJByYz3Ym982/4fDd0/DWkZWi7j+4dE9yRkH6RMODBS
	 E6heQbtUDye1CQkffXX+d+kYOk5+LRXZP29lAfjEfI50g0OHymKPxNbL33K1Z5/AI8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e7HiGSi+eBAKzHRlGvLoZKtK+8pEADviMUVKI4usKj0=;
	b=H5wieG6q2U9l6MhwoPxvMCBOtIOvsD3a2eaWsHEaNyMZrs3bxPMWd+Nrw0PAG72r18UL
	 d4vtFkDq9feFED4aqcKiZZKHUSznkMvwsTDp0UrRAjwXpN/uAD3LWRW3lhR6oVJ/SiM3N
	 HHPm7J63EY+zs8Famw26H61+MDW3Kze/YI86lnfSe9FeAaP+8drJj1rd86Iky4yynk93v
	 jJPy7KDfLk+jO4086L8ncBFooFpCXDwloq0mW1wGsY4j/TsuGaPORUIGiB0Rpu7HHSzoJ
	 RHQ8Dk/Ky5B1h5xCQCqYIv9XPPwEP2L5hP65hGSyc3z7aezwqMlC9sPm07PzdVH3fCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BegaPk5m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdJfXM9q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAED606C06A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAED606C06A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BegaPk5m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdJfXM9q
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU42l1557963
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7HiGSi+eBAKzHRlGvLoZKtK+8pEADviMUVKI4usKj0=; b=BegaPk5mCznUwGbK
	URIVes/UB0VI1nKH97RcBzjxTWA4Ma27Q6abc/xNRLxwSqJrb4Q7QEPVhnrFXtDm
	fAQmn+/NG/rA/5aQcfiKm5wqfm5Hi4+VP5F0oiZxCsj8rW1//UewQELaPIO/jU6T
	LbvATSTvAz/+PC8XcbJzGSR85/su63ERJAAo3vS7d0Bg+7XxHO16DgBj4GhU9Rop
	YPlJ8TL435w3mB+P3QTLamJ5T5jZbhsgCgk7/+LU8wrC8YuRQD+FG94d8/hZ+WeC
	JxJtrNdKBp0sFLMOdLuuRpl5gBD6vgIKBJ9oRO0sudXWudGSvW7SJgTOoGnVQaCE
	21m4xQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmq70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so1102752c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597431; x=1793202231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7HiGSi+eBAKzHRlGvLoZKtK+8pEADviMUVKI4usKj0=;
        b=OdJfXM9qwKdOogQZugI9qeSgybxnMtCvBj2gzU75B36HUhMzW3FU6qaS2bZMgZcw3t
         EmdvxIp3kSO2D3hAUZmKtMIfbws/sTfMrliEkcERPmbzI6mXnC7MkG6PWH8xP5Dky+Mz
         y9npqd5Y7S0WLjG6LNWFsQnw0GoV+bDNhp/aeqEa9LdF4URZJp/zhOgh0RWr5Gx1zUc0
         Rvh4U7vSguuSElbqOmCL9+DbI7b3CnyKNDIBPMxSeMx2eUjQzcKo6b5wfYE6J1GM2Js8
         9ONDWEnYFYhhlF/tveyUqkwwYPWiLC1A1Bws1uoFgwtT+Xxne4CR/uCdb4UyXulFYuNK
         gMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597431; x=1793202231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7HiGSi+eBAKzHRlGvLoZKtK+8pEADviMUVKI4usKj0=;
        b=I048Y28NKQp+w0CESmCbw6253Nkp/mHqFnQAyFGiNqcIEhAss7zZng84nr3cWfHVrb
         RpcNeEOlt24W4A4Z6YSNHsWp/EmMZcEXpCfADWCeauAxSR6LUb8eb6ED4B7CgFqyD6I5
         kNFtC4l4dDB2C4VLmyw5+CfrEFc6l8ZRbczB9vKYHWV981SvSWzQLOg/QfYl4iR6IapK
         UhyzWh/ITrW5Ox23wwk/JgUkv8ambRJGsazCgMmwL9gHSMUTSvvmSocavNLZuGnL/lqe
         vERHajLUrP3c1KwkuH2YMIIcSm9i1Sg+ZN1q484BvY4uQT0oHesejBarjG+exa2NDUEa
         jplg==
X-Forwarded-Encrypted: i=1; AKwUvBzXOEai6aub/2ZYMDeTuakfPTyaT7eko5kjxeekChWJP8E4ZITufHij2U8dU+gVAJ/08PzdB0LEApel7Cqr@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+/FYzWCWi5OuWUNk6OBZXolpUp01qq9l9o0NHhEZEmMXCQSwf
	T4kzqAji7O7OQ+4yv1mcakvsL1ByekN1G9Kjcz4YrFyqdaX1/NyBHBYIYankrZ/CIH+wXExcfHX
	cNBNKpOmDmvQG09Z3CoOdjvSThhFEk0H/9ugVzot5s+5DOw8DI/mmgYlvzk1XemZn1yqA
X-Gm-Gg: AYBFou2fxEIHYS4bMoASnN09iHwCRA/m4emVoo2n1OBthQHuU2zKXgA2mQ4ZaOtLIgC
	j+lBzQLupDnlKRndfTj7DW1RneEjgEmN+EzoTxg4tl9ENWXmOO+rGW43kgPxynQKYhUuMPTv+Fy
	aAqSKzR7wp/ReiFrGy3Inyf7tUSrWyCUAstldIEfCndK2ElQfBXllW3vx1cfQQcenZPDBBW9iAc
	a99vI3cqG2bY7WsMe+GMPtpmDpmIdgpfmCWPNEMesj4KVpEe/fcpVGI0iMIAK1JqE9oTZqe4t4+
	VT+fveL6S0HSJNaOWh3WhR/84MpxbcXawUkwGN2I6uHk4qzVw7BgbeYf4qDIXXpLgyo4f+6iGa5
	eOv/0Ka8TzNw8xgcRSNj6UHhQ
X-Received: by 2002:a05:701b:4210:20b0:159:f192:5290 with SMTP id a92af1059eb24-18dbf218391mr6806052c88.13.1792597430846;
        Wed, 21 Oct 2026 08:43:50 -0700 (PDT)
X-Received: by 2002:a05:701b:4210:20b0:159:f192:5290 with SMTP id a92af1059eb24-18dbf218391mr6806031c88.13.1792597430250;
        Wed, 21 Oct 2026 08:43:50 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm7937768c88.0.2026.10.21.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:43:49 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:13:11 +0530
Subject: [PATCH 5/5] firmware: qcom: scm: Drop exported ICE wrapper
 functions
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
Message-Id: <20261021-ice-migrate-tee-svc-v1-5-b035be7aab0a@oss.qualcomm.com>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597401; l=10444;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=vaZC/5EUswfLlBTapWjQ/fqR5EMZBzDkoGZAoqbtT8o=;
 b=al1RIRAzrlNsUBRsfVI8KChV9dCMpvFmWrcivh2ByRKvHkcb+VaXcduD5qPhnvKQWZfSpL5jL
 eihRtkRMr7/Bdp2+VgBRKL+lU62Nl1ScdwAk7VF5/X1LNkEgkWLEQVA
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX0KmhVIyo6B0N
 dBy1qxnC/yeXSwyA3rFKHZTSDBRHa2Tx5scLassB7y1v1/PxmIsfHDrl8uXmAbQmDmK6TZH2O7H
 NHH+R57WpVQNpkBxBV4dBFx2OsMr4ZQbchag+N36LruZ2cMxxO/zNiHPHsQnUngewGdmLlnRw0q
 Z2hMnYVRR0o1efOxtRAC0IG7OosW1WVrAiKZp8WJTZWBfb3OzvMFQuDkcrFOK4PDHFCaJxkIqYo
 7b2UUbWlruSyRQrbqYNXnxRNwRiYKjT7UDvjrsmoIOH94cqWYFyGpso/iV4ebSu4lklBIZsF5XV
 qolxQf6CdoBaQhvOVgfPr6qS9KKIh7hRyCIlLBwr7hGVZlNtwisxaVDPW95sBRlDa3yEsdp7wQ4
 PUUT7uLKjXP8RKDxWJYDcdm0nWKCf9dv6VzehlgwhIKDppesdq+td80hg27Wn/cLzKz9BxWRyIk
 2lnjoWWZsAamOBcv5Wg==
X-Proofpoint-GUID: n_F8ZvJ-Y9CFtjP-YH9CiAdS7RBhuGGA
X-Proofpoint-ORIG-GUID: n_F8ZvJ-Y9CFtjP-YH9CiAdS7RBhuGGA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfXw0lefflQkGTA
 2sk88ItwKHJnDQr2OvGgHzuWJtYhW92yC4MBYiJxYys3rcsIBTmfNR23iDTRdurthSRXQe7BuDg
 QB6FA1Utl5XLy6czfB2AKOy3pUfygIQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8ddb8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F3QbZBHQcOWnaqSeXxkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210062

Drop the exported ICE wrapper functions from the SCM driver since the ICE
driver has now migrated to generic ICE service which allows re-direction of
of ICE secure service calls to the appropriate TEE (QTEE or OPTEE) at
runtime.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 110 ++++++++-------------------------
 include/linux/firmware/qcom/qcom_scm.h |  20 ------
 2 files changed, 27 insertions(+), 103 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9aeb2cefa77a..2d2a4715a0c7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1405,7 +1405,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
  * Return: true iff the SCM calls wrapped by qcom_scm_ice_invalidate_key() and
  *	   qcom_scm_ice_set_key() are available.
  */
-static bool __qcom_scm_ice_available(struct device *dev)
+static bool qcom_scm_ice_available(struct device *dev)
 {
 	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
@@ -1413,12 +1413,6 @@ static bool __qcom_scm_ice_available(struct device *dev)
 					     QCOM_SCM_ES_CONFIG_SET_ICE_KEY);
 }
 
-bool qcom_scm_ice_available(void)
-{
-	return __qcom_scm_ice_available(__scm->dev);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
-
 /**
  * qcom_scm_ice_invalidate_key() - Invalidate an inline encryption key
  * @index: the keyslot to invalidate
@@ -1431,7 +1425,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
+static int qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1444,12 +1438,6 @@ static int __qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
 	return qcom_scm_call(dev, &desc, NULL);
 }
 
-int qcom_scm_ice_invalidate_key(u32 index)
-{
-	return __qcom_scm_ice_invalidate_key(__scm->dev, index);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
-
 /**
  * qcom_scm_ice_set_key() - Set an inline encryption key
  * @index: the keyslot into which to set the key
@@ -1471,10 +1459,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_ice_set_key(struct device *dev, u32 index,
-				  const u8 *key, u32 key_size,
-				  enum qcom_ice_cipher cipher,
-				  u32 data_unit_size)
+static int qcom_scm_ice_set_key(struct device *dev, u32 index,
+				const u8 *key, u32 key_size,
+				enum qcom_ice_cipher cipher,
+				u32 data_unit_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1506,16 +1494,7 @@ static int __qcom_scm_ice_set_key(struct device *dev, u32 index,
 	return ret;
 }
 
-int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
-			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size)
-{
-	return __qcom_scm_ice_set_key(__scm->dev, index, key, key_size,
-				      (enum qcom_ice_cipher)cipher,
-				      data_unit_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
-
-static bool __qcom_scm_has_wrapped_key_support(struct device *dev)
+static bool qcom_scm_has_wrapped_key_support(struct device *dev)
 {
 	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_DERIVE_SW_SECRET) &&
@@ -1527,12 +1506,6 @@ static bool __qcom_scm_has_wrapped_key_support(struct device *dev)
 					    QCOM_SCM_ES_IMPORT_ICE_KEY);
 }
 
-bool qcom_scm_has_wrapped_key_support(void)
-{
-	return __qcom_scm_has_wrapped_key_support(__scm->dev);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
-
 /**
  * qcom_scm_derive_sw_secret() - Derive software secret from wrapped key
  * @eph_key: an ephemerally-wrapped key
@@ -1549,9 +1522,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_derive_sw_secret(struct device *dev,
-				       const u8 *eph_key, size_t eph_key_size,
-				       u8 *sw_secret, size_t sw_secret_size)
+static int qcom_scm_derive_sw_secret(struct device *dev,
+				     const u8 *eph_key, size_t eph_key_size,
+				     u8 *sw_secret, size_t sw_secret_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1589,13 +1562,6 @@ static int __qcom_scm_derive_sw_secret(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
-			      u8 *sw_secret, size_t sw_secret_size)
-{
-	return __qcom_scm_derive_sw_secret(__scm->dev, eph_key, eph_key_size,
-				   sw_secret, sw_secret_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
 
 /**
  * qcom_scm_generate_ice_key() - Generate a wrapped key for storage encryption
@@ -1608,8 +1574,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_generate_ice_key(struct device *dev,
-				       u8 *lt_key, size_t lt_key_size)
+static int qcom_scm_generate_ice_key(struct device *dev,
+				     u8 *lt_key, size_t lt_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1636,12 +1602,6 @@ static int __qcom_scm_generate_ice_key(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size)
-{
-	return __qcom_scm_generate_ice_key(__scm->dev, lt_key, lt_key_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_generate_ice_key);
-
 /**
  * qcom_scm_prepare_ice_key() - Re-wrap a key with the per-boot ephemeral key
  * @lt_key: a long-term wrapped key
@@ -1655,9 +1615,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_generate_ice_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_prepare_ice_key(struct device *dev,
-				      const u8 *lt_key, size_t lt_key_size,
-				      u8 *eph_key, size_t eph_key_size)
+static int qcom_scm_prepare_ice_key(struct device *dev,
+				    const u8 *lt_key, size_t lt_key_size,
+				    u8 *eph_key, size_t eph_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1695,14 +1655,6 @@ static int __qcom_scm_prepare_ice_key(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
-			     u8 *eph_key, size_t eph_key_size)
-{
-	return __qcom_scm_prepare_ice_key(__scm->dev, lt_key, lt_key_size,
-				  eph_key, eph_key_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_prepare_ice_key);
-
 /**
  * qcom_scm_import_ice_key() - Import key for storage encryption
  * @raw_key: the raw key to import
@@ -1716,9 +1668,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_prepare_ice_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_import_ice_key(struct device *dev,
-				     const u8 *raw_key, size_t raw_key_size,
-				     u8 *lt_key, size_t lt_key_size)
+static int qcom_scm_import_ice_key(struct device *dev,
+				   const u8 *raw_key, size_t raw_key_size,
+				   u8 *lt_key, size_t lt_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1756,24 +1708,16 @@ static int __qcom_scm_import_ice_key(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
-			    u8 *lt_key, size_t lt_key_size)
-{
-	return __qcom_scm_import_ice_key(__scm->dev, raw_key, raw_key_size,
-				 lt_key, lt_key_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
-
 static struct qcom_ice_ops qcom_ice_ops_scm = {
 	.drv_name = "qcom_scm",
-	.is_ice_available = __qcom_scm_ice_available,
-	.ice_invalidate_key	= __qcom_scm_ice_invalidate_key,
-	.ice_set_key = __qcom_scm_ice_set_key,
-	.ice_has_wrapped_key_support = __qcom_scm_has_wrapped_key_support,
-	.ice_derive_sw_secret = __qcom_scm_derive_sw_secret,
-	.ice_generate_key = __qcom_scm_generate_ice_key,
-	.ice_prepare_key = __qcom_scm_prepare_ice_key,
-	.ice_import_key	= __qcom_scm_import_ice_key,
+	.is_ice_available = qcom_scm_ice_available,
+	.ice_invalidate_key	= qcom_scm_ice_invalidate_key,
+	.ice_set_key = qcom_scm_ice_set_key,
+	.ice_has_wrapped_key_support = qcom_scm_has_wrapped_key_support,
+	.ice_derive_sw_secret = qcom_scm_derive_sw_secret,
+	.ice_generate_key = qcom_scm_generate_ice_key,
+	.ice_prepare_key = qcom_scm_prepare_ice_key,
+	.ice_import_key = qcom_scm_import_ice_key,
 };
 
 /**
@@ -2905,7 +2849,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		qcom_pas_ops_register(&qcom_pas_ops_scm);
 	}
 
-	if (__qcom_scm_ice_available(scm->dev)) {
+	if (qcom_scm_ice_available(scm->dev)) {
 		qcom_ice_ops_scm.dev = scm->dev;
 		qcom_ice_svc_ops_register(&qcom_ice_ops_scm);
 	}
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..36b87be82804 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -46,13 +46,6 @@ enum qcom_scm_sec_dev_id {
 	QCOM_SCM_ICE_DEV_ID     = 20,
 };
 
-enum qcom_scm_ice_cipher {
-	QCOM_SCM_ICE_CIPHER_AES_128_XTS = 0,
-	QCOM_SCM_ICE_CIPHER_AES_128_CBC = 1,
-	QCOM_SCM_ICE_CIPHER_AES_256_XTS = 3,
-	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
-};
-
 #define QCOM_SCM_PERM_READ       0x4
 #define QCOM_SCM_PERM_WRITE      0x2
 #define QCOM_SCM_PERM_EXEC       0x1
@@ -86,19 +79,6 @@ int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
 			u32 mode);
 int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size);
 
-bool qcom_scm_ice_available(void);
-int qcom_scm_ice_invalidate_key(u32 index);
-int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
-			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size);
-bool qcom_scm_has_wrapped_key_support(void);
-int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
-			      u8 *sw_secret, size_t sw_secret_size);
-int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size);
-int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
-			     u8 *eph_key, size_t eph_key_size);
-int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
-			    u8 *lt_key, size_t lt_key_size);
-
 bool qcom_scm_hdcp_available(void);
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
 

-- 
2.34.1

