Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE43E9C1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555167; cv=none; b=WUR7bAa2Op3e2GHRzY8br3KsP4EPpKHXUopeE3e3nLTBesLfSq7Nn0NZUsRToxLb0v5htp8kYJZFfEWJAY7p/wSvAgESQWWdT53Rn3IGa1oGN8EVo1M1iNYOOGXZ1WVU8bhjQqBPV19BgbHAlerNo7rT6m7vzpgkYWa3CbNIIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555167; c=relaxed/simple;
	bh=rsrLJ8U4ENj2NwP7dIsC92cQb9GWiEQilwgM3BVYY7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dqsJbhOEVJxbTogyveWfUZXUCGrP9M0nwZucXZewFCca96RFA9v/lYVL9vFGypePJBtYFtufPe3j0Nks426W+g7nmNzJPFrAKukSYcgN33bdWNYRPgv6ArZ40f+wCJChkOUCyDi63Jd7/75N1CLpWHGfoD2U3hg8WbSMlxVGveQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E83YXJD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJGwcAGr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E83YXJD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJGwcAGr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RKRl866802
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LWUptU+3+1yqjWwnn1UpgN
	xq+vQcwQvffdiDdqR5MfE=; b=E83YXJD2RFLyiFDaofvcB8b2L+Wt+P6bfWy08W
	y79+NuZhCE4Md+2n1IJIHV7sI/FvQuKv7s0zIg81iS8y/+kFwffO9KKgiOCa+TvM
	pq8f6YU+5rkkk4rhe0nSys5X7HGPYMtqIf6tMuyoOK38zDDU/EVKSrnPSDVMSNaC
	/MODPrbE3wMgAJBhIYDJuz+JBveB6yDlQxQcsiVV0jHMwPj0Sno6sb2S73n4p8sO
	yILAwNpL/RIvPAOTi3rIdEBiDKtWZ96X07Mv5g2aw4seUSmOrWbe8BeCHlm9vVYQ
	nekYXrCSyqQe56tdCz/3feEmwPtJdiIawFC5EehHIuffmXMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwte0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848568a6f62so3409594b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555160; x=1788159960; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWUptU+3+1yqjWwnn1UpgNxq+vQcwQvffdiDdqR5MfE=;
        b=bJGwcAGrAa6na20T0DHe1HHbndwndqrLgJPDRHXkC2a/ko0R0qXGSlIwOhPqeRgNQk
         ZzkDNesiDZVbazEReSXJ5vAp/WbkuI9Cg4uyKwqM28r3NJk6dwV2pA69tm1WfrNTRogN
         LINJIeOK6rBmTOb+dCFAcdT2dKFSA4SnNuTSSGWXlNXpqHTyiZNjakChZDJL0biEh8k7
         W7JwuoxEn1/baE9PzmR3klCci5rYGK+TiqkseTAyORHmpz2Vt9gZWJEDTHp/z/k11M1P
         fflQ0CdW/VB1pQNbTiV5gc88tqJ3TjpMLHa+TypmyhwAlfG1mJnswut2Fk2oG0vzf0ne
         k5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555160; x=1788159960;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWUptU+3+1yqjWwnn1UpgNxq+vQcwQvffdiDdqR5MfE=;
        b=AU7+L8eq7D/5tqxbkLhyBb9wmbBXtlb3XXjM0gjda7Gl4SvSH+Ql9pXOGL2xmWMyRl
         lM2B1HYzlsUoTCsMzySEGcDXGbGJD8BcyynWaycSrFdcnVR8tqTJ9O34H2XUlLL371aI
         47nev8HXTp9EydpYypAxtjdrNP5R1dGnukpRW+uIMXTkHKJBb2xUK0y1sGKQ+YqfQRHs
         GRW4koa/vfWITIoHzoxGPnTk5MwJirzhj8U1LX2sgXqZEA5iYRCO7TBIkCLms/SzE2CB
         tMUT6aE3VNHUtNybBS85nA8t7SJYimPyb3CZyEYhWwEU//A3xFu6T9yIQas6YB4VHEiL
         98aA==
X-Forwarded-Encrypted: i=1; AHgh+RoVggwnv6420LjUxc3SLl6a0btE4FYCdn6EMrgFvjKwgvLrw6g6MHHiXChNa6mWgDtzonqajNqp3aJIXQk3@vger.kernel.org
X-Gm-Message-State: AFuF++ly5fgNbkQrLuYYGkq4Ej2bpbJf5JgdbuUC0ozcq4Mva9/Q75a/
	3nk04ylZ8wOTgoNkmWE9XSdNkFCVUk9amj6NTV5Cxv1o3j9EQ5qRy7MHRb7wJytzZyHMryLEIwS
	rIkyyKIRr9kV6t8ODIfryUdyCrFv05EZel+UhXvYUXIdWS39LtvcuEn8BZEzqKtU3NHmy
X-Gm-Gg: AR+sD10kyoqkum02/N+Qf1xDzfSbmg8XYYu5tYlqLVPtUHA2e3Y2PyniMVuUlMgi/U3
	RE2VeAGd9REEkLWiWygOQWt2BW/r2EAddTIR1c/ymB9xGPHNNg0LFd3jDw9KoxsnTu5Alz+eaAL
	vAcvtPLCSrfe1y1sZWgMHBaLsS9NwCBVDJhU9FaRVDkJXnceUrsZaNB/SBerkDjj40NOphql8BL
	ajuXNgXfsOWPswJuDkXqqW+Mr5/Hj3h9aZ3ugr+34syliR5bEg5Cp86WE5mMR+MSxltM7oYh4qi
	30fx3J4RQ4b2mwgBDiHLxLRE4XIXXimGTIHsOLfBPauxmhx7OOmP3s2dVAIGwedkK1AA07A7a5A
	1IvdcBYg2mSRyANZCOej9iHnvcusyXCjEg5eUTQWgIbkyeeRICZn4Owg=
X-Received: by 2002:a05:6a00:2ea1:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-851fa060bf6mr36033953b3a.17.1787555159720;
        Mon, 24 Aug 2026 00:05:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea1:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-851fa060bf6mr36033879b3a.17.1787555159318;
        Mon, 24 Aug 2026 00:05:59 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1642178b3a.41.2026.08.24.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:05:58 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/2] rpmsg: glink: Fix version handshake race against a
 late RX interrupt
Date: Mon, 24 Aug 2026 00:05:52 -0700
Message-Id: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDti2oC/42OyQ6CMBRFf4V07SMMZagr/8OwoANQBYp9hWgI/
 y5DXLnQzUtOcnPOmwkqqxWSszcTqyaN2vQrRCePiKbsawVarkyiIEqDNKBghw5rqFvd3wGHVjs
 YrHFGmBbQldZBLKuMSi4TwShZNYNVlX7uiWtxMI78poTbvNui0eiMfe0/TOG2++Ty37kphBCCL
 GGVUpyXjF8Mov8Yy1aYrvPXsyUOX/ivT9CKxSxPheT021csy/IG+UApaTkBAAA=
X-Change-ID: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787555157; l=1580;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=rsrLJ8U4ENj2NwP7dIsC92cQb9GWiEQilwgM3BVYY7s=;
 b=uCERt6TTozohUDjCQAyT0xQSAPWh4m6Sn+W8nbkWGyiHF9w9Qo34qeKnkzMeaBEs3PCeZejC2
 U+ieIv3/sucB2x6fY9/TpnYaUnYYtAulkxnigtj1WR5tATStSr1wVlr
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-ORIG-GUID: _r90-7P78GmkGmdAOGKd047IBAMvJ66A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfXx0NVQzxpPnhc
 JiIxNupRxwIUohBDyQxKshJIgPbfStmfdAtTZ30btDjT8odwaqzv0o5HTL5srXqhpZ7ATpY1le6
 bDZ6M+iiconHEvNjt0E49eBXbmLAGLFPe4Kp//wv2Y3Nh5IeCZZddhKUC0toe0p4nBQF6ckapTr
 PIMu/UdZ8rBGM/fzjwxqiExM9u2MpDFOCQtBas7ItycjGVgN3BV2trE7uhYKl1uZSJqeO3ndSSb
 0H0L3CkE/3K0YgzurSezDUsQ/vjGwdlp7EKA4SNeP5LobGnhpsSpbARCi1X3/C6Dl3dNKNth4Wg
 Y1kgNav0VvwBwDFnZmksRrZ1IbLa8e1eRufw7RiEHTVLaRBFkQfpjaj2afLvNelqL2rKn4OdKRC
 299eEfa5EkvSq4mW5cbs15lbTb6aOpykDq4V0K4kpqxYJCXKpw2yOiSoFVVFhbIHtY1rtFjgF3n
 2O4lpQcSZXEprRyMojQ==
X-Proofpoint-GUID: _r90-7P78GmkGmdAOGKd047IBAMvJ66A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX5hnRWtwFPbm8
 mKqCRvi/BhYomqh1BuNZEpFar4sy8Et0RLPrKMQWVhOek/kxZasX70sCbADMuT1mtBDXrOKvqVw
 2CfCKn3+lyoQgqk7+DBtVI/X4IS6ou0=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8bed5c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cGRP0HO9ATsEQjh_m_AA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240060

The glink transports enable their receive interrupt only after
qcom_glink_native_probe() has returned, while the version command is sent
from within native_probe(). A remote that answers quickly can have its
version ACK dropped, and the handshake never completes.

Patch 1 moves the version command out into a new
qcom_glink_native_start(), which the transports call once their interrupt
is live. Patch 2 drops IRQF_NO_AUTOEN, which is no longer needed once the
ordering is explicit.

---
Changes in v2:
- Drop IRQF_NO_AUTOEN in a second patch, as Konrad suggested on v1.
- Keep a failing chrdev registration non-fatal in native_start() and note
  it in the kernel-doc; v1 turned it into a probe failure by mistake.
- Add Assisted-by tags per Documentation/process/coding-assistants.rst.
- Link to v1: https://patch.msgid.link/20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com

---
Chunkai Deng (2):
      rpmsg: glink: Split protocol start out of native_probe
      rpmsg: glink: Request the RX interrupt already enabled

 drivers/rpmsg/qcom_glink_native.c | 32 ++++++++++++++++++++++++++++----
 drivers/rpmsg/qcom_glink_native.h |  1 +
 drivers/rpmsg/qcom_glink_rpm.c    | 30 ++++++++++++++++++++----------
 drivers/rpmsg/qcom_glink_smem.c   | 27 +++++++++++++++++----------
 4 files changed, 66 insertions(+), 24 deletions(-)
---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

