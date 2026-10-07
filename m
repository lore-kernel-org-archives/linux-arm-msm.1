Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2D5B206
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362697; cv=none; b=NvTlGmImxCNCibirL1t4VukzbTyxgXr1+DqHvCcEY6JMMYXjg32ABb4kAg7OQnV1ynyOaZm9jpb2TSHSClmjXO3mvMH85vu0ObVvu+Lwe9rRNOeu5BZ/bSzR1QdJokDjxrwYXXycQFhocbVhYp+whN8Sbp5vwF/u+aoC9Qwk9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362697; c=relaxed/simple;
	bh=R1GC71a6rAy5xNZyGeUthVaaxX45xvsX8zv0aZHsi8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nra94bogsGSF27U0P4EWMUS4DxPjs4+w19JQhOKftHe48gTaTjFxIV6QtZsA7tkg+xjppOSzcCSfOEMjdA1P4nlEFBpWCs1JSTs0poekzlupjMx3LdfWdiW3nsRXsWkz1iZqjNSrhNgnkPp8reJiAs1cZFCoy+g8XdpdwYLPTlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyAP/4DG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6gxJloK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyAP/4DG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6gxJloK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnMr3334832
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 08:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q2lUZd+NOfLas/RtnAkzw273rfkO78ELCSZ
	QLywp02A=; b=TyAP/4DGiPiFXCprcFD25S3Rt6kfGNvgmPPLexn2xQZXcXAygF0
	YYQjKKblQzJXt7Gbv7l5P8qunV4SE3UISmQQoNTi7gnjlh9nnBGP/2eZ+BUvui8P
	QRl/3IB/GfkGv7mBTwCvTQCYn5k6IFSZ3+xWPs8LuEU3KdLgJhh9IjtoxNgEDC0p
	tB99M0DiCcACT5gsvInGqsAHl+ElXZpvUG5z/pKPOyjEg4W0x4Yb1cZSBQVMEzVD
	rAdh6cnCVaSxTGfUrBDV7D7YVGUwjGq3x36ugtEd/KPo3jNOznp2qjjc1AcFtNSy
	6e49pdJkkk1iiZeS5PLQpUe+vaSGuUpO3fQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h546238vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:44:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso6077972a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362695; x=1791967495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2lUZd+NOfLas/RtnAkzw273rfkO78ELCSZQLywp02A=;
        b=J6gxJloKAlx0gMrvB+AYxpilD2JOMEeXuNpaKQ3+UN7jP3xbsLvdLFl2hf2Rw6WMs/
         91Yo0C38TGxtEZ/s+/o6ncv1yINbbxrMKj4Wfm0ETwEo2D7/IjzvtwZrqKFPHqzYhDDz
         zwfm5eZc8gWVDqJ4NpCmldcyf5S6pT85K+ig5Nk1xPODtMDAPRb6AGD2xAOUCXTRtxXG
         vcNsavq0tNQ+TXi9egvChbp3ALDsVdjYHOvIQLR9wcClkktlpLEyba5f8Bcpl5J410QL
         v0WfVxuXYWxlatfBB+Ym4QDb2fJy6rGaE+Nzy0Wqy9C/aAeO81o1prfVvUd1SOZrqsAd
         6F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362695; x=1791967495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2lUZd+NOfLas/RtnAkzw273rfkO78ELCSZQLywp02A=;
        b=2Cm7l1IsNHzAltiPi4UkD15JMQiNIo6xQccqrnN6SsMuZ0mjT1N3gcF3nMFD9onSAG
         9I+T7wBVhah0jPY0XtyGxfgjcRHg6WdjPw5IFVVOK68VtdQl/EJIo69+195KMl8u6eRl
         VHt8i1NrrGWOY0WkA67sUSMkd5J+m/rPYaSPxSOgkGJJ8HmzsaU8kGfReHUWNgCrOdjn
         BdafruHwX5a8q83t1Rq3Nj6MkpmGnV1/A/BsuqbbWwafsbQ5wExl8kJTWjCOxjZMGrYW
         RjzarzMpDEVZMp4saZhdEFxDGU31X6CTvw/5hsnlwCzwcWLbHh/TAu6ipBekfp2h/B6F
         JI9Q==
X-Forwarded-Encrypted: i=1; AKwUvByoRDbrG66qYDq4oiQKx1ygqspwUb2rUE0VriVVobdE1g8gISDyJ1hQbjczHrThu9zwgNitGrrxq4FhzagH@vger.kernel.org
X-Gm-Message-State: AFuF++m6NkuMmhCv8GxHj7kW8j2uAUZWYJ7ZQ2WMTJ3eVTRH/VdSeG1+
	nJwZIa5xF2y9KOXd7MGU1qoim/XW02B3UDvB+pcF6l+BkanR8kLgcKJXWB80UQQQtn1vF0Djets
	uHF/z6FvmG3gdbDy29AYXuUloIGhGFQrxSo9NpZ7Sv8cUC5ggxeVevdXZEA1neMfXdybx
X-Gm-Gg: AYBFou0soFLao5pbG6sc91LDYEzOfAObTfbYiLm6gWdtrfgBa6TXTal+p6ZIaZAmYhi
	dr5p8U843sc8BCzGd4W5NbuQmwnSu6bnUMge6BLD4+S5NdTdy0eB30eTW2WeZOBCkFmbju8Fexu
	VomHQFgOWLa3b67Kw2LEZHTfTX43CLsZFXoNced0N1ekKlV0JAS/JJvlRgpl12FY3esFisotohr
	bb7Yl8yKnk5Mj4F8lctvyMJJhGvbP59gBKyUR4JWyfY6+FqzRaiFjglsOyyoiTxXCJXRb9+p9oB
	5huIxwKZtWz+3quJc6hqH0GNyqs+eHOFIKgcl+yTCR6yMW6eJzOe+bXwA82LQ/tfQ3eNzVMNFoJ
	vdSGwX4W+6Siw6EXFAM0wk80TCPKbYeZ4wE9nBx/ZTQwNVC4fVFmTG07ZML7Ns1+TBj34j/w=
X-Received: by 2002:a05:6a21:110:b0:3e0:c961:b5bb with SMTP id adf61e73a8af0-3e134110119mr1287573637.66.1791362694648;
        Wed, 07 Oct 2026 01:44:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:110:b0:3e0:c961:b5bb with SMTP id adf61e73a8af0-3e134110119mr1287555637.66.1791362694237;
        Wed, 07 Oct 2026 01:44:54 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm1075091a12.6.2026.10.07.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:44:53 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 0/3] misc: fastrpc: fix UAF and Oops around SSR teardown
Date: Wed,  7 Oct 2026 16:44:44 +0800
Message-Id: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WEOcaYyp2vsCuaLmnAdctzXw22UAutAK
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60687 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Eij5vUOpqSaEUsYIQxMA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX2xpQBn/fM+Be
 52Zr7UY6tVx5ZcpPNELZtm/fDWTKbEmaahrI8eqzv+HnmHFNNnHzANzvHG11UCfFFULV6mozx7a
 idibKYOCCaT9s1UUsRVu7K6Xz7uveXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX04LxURIWTaSv
 0VXqHxFi+6nEry6QL0Q8tJesNv1RD+cOwHjtQ+FaDYUz41G6umDBR2b4Ypkgx3MkEzKkU2qNOD+
 MPTn21snHoD9rQHJszYiwUs2+mFGAjm1VBdp5yeNIgkDVDKumTlVykorJ4NURPuUhtK+su+4nUN
 A4iZC3aP6u8DhQGRc/+kblQvzVdofmxdoYDD7CXNAGRjzDYXfaB4+OdzWZKU3Z0o7Y/y4ClTeXD
 FMFej0+/knshxIH30HIA2HrLlyq9wGysASKIh165Q25TaPPREub03I7eiCoM0gdOW4XKCTlULKk
 5cjm5+Qe7TCaeUCibBtURC/Es7nt/k8jiVZUnLnFLsigIOrz5FIO2LCawIcGYtau0XdH4SBR+5Z
 zSKhkrcc1bjZ1Y+4afEJUAfS2/Y868kuNiZqWCTw1bNHvq1mce6RwU/kw6FXKOllIRWyBy/6sup
 2//82u/UFGOnlRCHX7Q==
X-Proofpoint-ORIG-GUID: WEOcaYyp2vsCuaLmnAdctzXw22UAutAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070034

On Hamoa (X1E80100) IoT EVK the ADSP can restart repeatedly, and every
restart has a chance of taking the kernel down with it:

  Unable to handle kernel paging request at virtual address fffffdffc1ffffc0
  Internal error: Oops: 0000000096000006
  CPU: 5 UID: 0 PID: 2766 Comm: adsprpcd
  pc : ___free_pages+0x24/0xe0
  Call trace:
    ___free_pages
    __free_pages
    __dma_direct_free_pages
    dma_direct_free
    dma_free_attrs
    fastrpc_context_free [fastrpc]
    fastrpc_internal_invoke [fastrpc]
    fastrpc_device_ioctl [fastrpc]

The faulting address decodes to a struct page for a PFN that has no
vmemmap backing. It comes from dma_free_coherent() being called against
a qcom,fastrpc-compute-cb device that of_platform_depopulate() has
already unbound: with the IOMMU torn down, the call falls through to
dma_direct_free(), which takes the buffer's IOVA for a physical address
and hands the resulting page to the page allocator.

fastrpc_rpmsg_remove() wakes every pending invoke with -EPIPE and then
immediately depopulates the context banks, with no synchronisation in
between, so woken threads race the teardown on their way to
fastrpc_context_free().
The series is ordered so each patch stands on its own:

  1/3 is an independent probe-time bug found while debugging this: the
      misc device is exposed before the channel refcount is initialised,
      so an open() racing probe hits "refcount_t: addition on 0".

  2/3 makes fastrpc_notify_users() wake poll-mode waiters, which today
      keep spinning on a buffer the teardown is about to reclaim.

  3/3 counts in-flight invokes and drains them before touching any
      channel resource.


Jianping Li (3):
  misc: fastrpc: initialise channel refcount before exposing the misc
    device
  misc: fastrpc: wake poll-mode waiters on SSR
  misc: fastrpc: drain in-flight invokes before tearing down context
    banks

 drivers/misc/fastrpc.c | 63 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 5 deletions(-)

-- 
2.43.0

