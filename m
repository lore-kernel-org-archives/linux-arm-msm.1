Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196431;
	b=TR7jbLIuSt4aB88nILcljC/nam+rSLglxLKtqmdKNQxc8pReUaTVr81CDesYLmMzX3cd
	 I97sGe+tJh/9A0rifAbwHw4l9JPAbMkXnESk1EwUf294Tu2cSKtLExDL7l2AFtjZjZ7Rl
	 0VqkNvAkmfiZyNhr8uhiGgrDj5AqQQvX8kgrrNcT38Rdfba0OsazHhCagFT5u07v3j8Uj
	 C9wCRebnDQyWMe9sO/vtoJfGdUYcj9WKQIwlfpLMagpunaAjW/pjqTYvwt25+THNwcJ6k
	 fNXb8kwjIz6sc8CivJq5OJn1Aub0e5USTgMTpu22ERnoceZb/LQvZahLNEaqQFvwdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fe0PplXkfJEjGF1pRChOr9FUjudOYaWFATaaoi8fy8c=;
	b=PkchEFxcB0tqr1KWm4b+EaJptvsmYHaVxRVhp3ngS1gFbJsZExLLu9Jx5t6kHiTmIAt0
	 PUXX73J2fhuQbOsbpXimgBmn7KUrThoZtnhxhhVF7HYfu8opgjer4WPU0iCVaCa/ETQCT
	 LWJTPIB/AdGyAleJvZLHb4yoQawBd8yOXkDTFb8xUK2VKUEOAB8XhNjyH36401YjkURzj
	 meSQmT3WVDDLaGJzIbSyLdY3fYiu5nWRd53nXdo9Jan74mGjJcbRSQZdccp5ER3guloum
	 ZsqUGqTU9lv0CKQ3rHJ0473rjLS9EB70oHB/i54aiGnQMg8U55p0ykzZmuQSux1fm8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNKmrKTU;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417060A2611
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D417060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNKmrKTU
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c48582654so14698121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196428; x=1795801228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe0PplXkfJEjGF1pRChOr9FUjudOYaWFATaaoi8fy8c=;
        b=sNKmrKTUQ+N/e8JWkw8tQEKL0TzMegwf3BapIpPt8Sz0nA4Xcx5K6WXIWVmuU2ZAMu
         Ec2of/rPL6lg3oAKglcGb6H51PtIkHkEPuwWe1vNTuZNycrogWI3r5NFC9PbHhZVhrvX
         b1pzXgBYMXA5KE8Gy28Ofs9vIABDkefs24m0Wr2lGg7+F1JEdRUt8Y41sBaq6E0yPRVI
         BEgb029AAEWFrcmUkmZfovrq8xnjbpdBu9GDPWxess9y4swJoSL+xwT+ComaiJQZWQ/t
         3dQMFVPYtQdzWal5YKkSbOrYVQWETQxE1OeSxE6vsKDiD2iUUJpuYvdlPdgDqngBQf35
         AQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196428; x=1795801228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fe0PplXkfJEjGF1pRChOr9FUjudOYaWFATaaoi8fy8c=;
        b=OqsuBjSPaO67HNG6XyRI4Pxdj6Ef9Bt4b0SyAz8iN4mKvxWQLLGRth17LR/fVFL3U7
         Cxii8kULyP+i/cj+8sWF7Qw2VLJuGEcDQnq9RUGKBAdPhejOaWEfXkE21pG4EaDc8y5T
         lSZA5YRNAIunbw/SNhpazs6IBFqmnbwtHg8WNl8CwAoYQHRj+73EHIsQbACIsbBfzRwA
         kUEgD3TGid5krEcMSkFB8Sv9Xmlu46/xXW/R9z4Z+W5mykUcyLG9E2WLCoQJ5Wjizolx
         CwJpKvonvOQ5HmhTMQejjSVgxBE02hCB4gxKxx9oCe8LH0GjRGKTdTUMMa7yQVC2ygI1
         xVqQ==
X-Forwarded-Encrypted: i=1; AL+hErHncjdiSU1RkFIjtz/it1KJD2nwfXN4sMB2+a8RLfmAlv2g8bbZk6KH8yoPqY50i3lBeDzOpz+2kC7hhclQ@vger.kernel.org
X-Gm-Message-State: APuU4Z++S0rBTR/f9Vz4NkFw7FKdWmA7G6zUbhAW7q1D6kaI/mDDkRkK
	iWht34vPkPm53oczAze/syAqYSr+hFrc8q/MBz0/ZxYFoUIOJ3MeYZet
X-Gm-Gg: AYBFou0Z0wOX0FqKAZYb/gWYguBYpOWIRh8e289jmZVtXzljq+xEaldesEvSLtmx9oh
	hSAO8I0inJPdb5fgErMm3yz0ufQhPwIpX9rM8X9pAyx7dZER0EsJcCkZjn4YQw7Z6a5aC4BLsVP
	k4LxtdC+0yXh4S65eUrTx5ar3F4hU4Qo6gWe3Yx2QdMipQucS+ekU0ThjAHXkmx6V0uJ9Weoz67
	/DDC02+nmZpDkGMEBUYpGGNGxSDKzPLz7JCqu+YYLxkpXW660LVg6wvCm9QOlNab/0ySSALx6qK
	/xrC1Pvt/sBdmpwhg3XH6gdtkZ4rnpIZT3dk5QqHXmWy1Jml6Gs6Xxngk86Tcm8IcfXfTfvkUy7
	wbnMpl9mfiKTgTIY5b1+ba4I7aCWrhGWYK2/aW3RsCX906tXf5i7nA09LTtd8WQE0aHbporaXvG
	EwQd0VHGCSEgPKR3nNrBeb9wmGkqu9iznflE5BDs77V0F3Rfa/VALCkBDJUkCRzf0tYHN/3fQHF
	nr1iD7+ci663EHyMTo6ftPJdHI5gdANVBL9ksrmYa28g0VhdDlmWOfy6sa+v4jmz93Wc/Wu7fFT
	N4f/7KDammLRQZgJY/ZqFXMzvVRt9LLaPt+7hU6JDjH1ZEevI1wT0pnUl6JAeN0aTxnXC23ZdYi
	FZ66KBepIcCn28+kN1dmXs8/zy8LiXyHz8lVm9+6WZIjnMVHa8doyFVSwqAZvvsTtyJXS2xjrJF
	c6a2zIjaaJLuipMpVC+oRWqPpQpHsMN3k5TqelZIoDW54UC9MYsOjMmNI79S2AQGGQgGH4QEuL8
	7Dmowbj+SSrMINS/Gs98KknOl8wY/veegbDuwsRMfMGIg==
X-Received: by 2002:a05:622a:2609:b0:55a:df3b:38d4 with SMTP id d75a77b69052e-55d76b5b9b8mr68312731cf.75.1795196427747;
        Fri, 20 Nov 2026 09:40:27 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm28110831cf.28.2026.11.20.09.40.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:40:27 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Fri, 20 Nov 2026 12:40:25 -0500
Message-ID: <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795196107.git.jesse.casco@gmail.com>
References: <cover.1795196107.git.jesse.casco@gmail.com>
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

CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
with the CSID's index through parent_dev_ops, camss_buf_done() is passed
a CSID index and completes the buffer on the VFE of that index, and
camss_reg_update() is passed a VFE index and updates the CSID of that
index.

That holds as long as a SoC has the same number of full CSIDs and full
VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
only two full VFEs:

  CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
  VFE:   0, 1, LITE0 (2), LITE1 (3)

so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
fails to stream with "Failed to power up pipeline: -22" because there is
no VFE 4.

Look the VFE up instead: a full CSID feeds the full VFE with the same
index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
This gives the same mapping as before on every other SoC.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7d9622097..8020b675c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss)
 	return 0;
 }
 
+/*
+ * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it feeds
+ * none. A full CSID feeds the full VFE with the same index and the n-th lite
+ * CSID feeds the n-th lite VFE. The two only differ when a SoC has more full
+ * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VFEs).
+ */
+static int camss_csid_to_vfe(struct camss *camss, int csid_id)
+{
+	const struct camss_resources *res = camss->res;
+	int i, n = 0;
+
+	if (!res->csid_res[csid_id].csid.is_lite) {
+		if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.is_lite)
+			return csid_id;
+		return -EINVAL;
+	}
+
+	for (i = 0; i < csid_id; i++)
+		n += res->csid_res[i].csid.is_lite;
+
+	for (i = 0; i < res->vfe_num; i++)
+		if (res->vfe_res[i].vfe.is_lite && n-- == 0)
+			return i;
+
+	return -EINVAL;
+}
+
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
 	int ret = -EINVAL;
 
-	if (id < camss->res->vfe_num) {
+	id = camss_csid_to_vfe(camss, id);
+	if (id >= 0 && id < camss->res->vfe_num) {
 		struct vfe_device *vfe = &camss->vfe[id];
 
 		ret = vfe_get(vfe);
@@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
 {
-	if (id < camss->res->vfe_num) {
+	id = camss_csid_to_vfe(camss, id);
+	if (id >= 0 && id < camss->res->vfe_num) {
 		struct vfe_device *vfe = &camss->vfe[id];
 
 		vfe_put(vfe);
@@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *camss)
 void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
 {
 	struct csid_device *csid;
+	int i;
 
-	if (hw_id < camss->res->csid_num) {
-		csid = &camss->csid[hw_id];
+	/* hw_id is a VFE index; update the CSID that feeds that VFE */
+	for (i = 0; i < camss->res->csid_num; i++) {
+		if (camss_csid_to_vfe(camss, i) != hw_id)
+			continue;
 
+		csid = &camss->csid[i];
 		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		return;
 	}
 }
 
@@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
 {
 	struct vfe_device *vfe;
 
-	if (hw_id < camss->res->vfe_num) {
+	/* hw_id is a CSID index; complete the buffer on the VFE it feeds */
+	hw_id = camss_csid_to_vfe(camss, hw_id);
+	if (hw_id >= 0 && hw_id < camss->res->vfe_num) {
 		vfe = &camss->vfe[hw_id];
 
 		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
-- 
2.56.1

