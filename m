Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF7A4CDDE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408392; cv=none; b=hgjAPBdnb+XjaqOhsf+k6OoejTNd7cmHdexNul989WquCjeETTzpisa0eNC4O5W2xkQ/AVo4CLOpWiep74PICKLhatzrCttNn4G3lwb8lgFqRfw0a9LNc9/QDr+uYS6QUdexJ2TUaGOb0/OBPrp/UAzWo0pI4vOFo65VNGQz4xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408392; c=relaxed/simple;
	bh=36eUkGmRXYxap1bERqmr/vE5FGGwQMd9qbYovbe9Irk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jp7ky+9QzHM3Unq02+uobOlz3q6anRsqgOez3GXFFmu4XEAHQWlQ4OupXbrmzIpFKvDSuv0YB1R/3j7gurwEVy7powMmKV8rqhurGF30l1C06mTWUf1N5eKA9v4zWnSkKdeE/zZ1syCkgUcZ1AN98Nky/b3kYepjG5mnJX2aX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2AorjXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJOhzXkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2AorjXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJOhzXkN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5Bw724621
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TlR52ADOonRtbtSebcO0TM
	M6uvs5Fomcnb17yypt3k0=; b=H2AorjXPR4i5+V6vjUhVDvfucimDnkCoZ128F8
	aIT/iViFIK1okOqIM3aHSDRLrMWsq3liL+d5unAby16qYX4a8OsX35tipIZxEF5s
	liVri0e91/7WYcjZqGZI9K2CjgUyJGGNEfHwMO3u/zwRPbtxot0GNgvdA8jkLEsn
	gISpNCGAwa7UxkXVyPdPmc/rmDoJ0NrIZaDl/AxtduuBJHhAmRgmcRRlXOOVBJyE
	YZOi4xKmImJshfesCzpuddC+kC/hm6iaTyZ7b6vsloic9rC7A/+4CyHYvonItnfF
	vUZ9NkYGROt9No3YmuFdf2bP9/kGZnuatwhgwnXHYHjMskrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65grnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:13:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so430028285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408389; x=1793013189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TlR52ADOonRtbtSebcO0TMM6uvs5Fomcnb17yypt3k0=;
        b=EJOhzXkNzG47Y4Ywn/ziuDwMlzR0vkLlmMUUuatUPGEHi4OmQrHfQYKJgHBG/vn7tn
         u8P5GaWRRjaxUhO1mA5sUzWVCXcQWkBEXAdr4RHeJENjA+XUGKb/DISIR6Av1Vuh6Zbx
         eUOwwjEBPvi78Qjz8drjNPzc9ldfz83o1ceExMtwav2i6Rb62IZgF3Bsk/ParrawDBVH
         +LFE4nkIAghXK97KkPHhEqWPnzEE/ZcoIaPCfIt+YvaTWwYR5z3C2OpWK2599iim/ZJG
         X3DHj8uiXeEBq/SiuYLd5m8+sujR+ICx7pDLjyHHJw9cwH5Lot1LiCH83WFO51l6Y3V9
         V3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408389; x=1793013189;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TlR52ADOonRtbtSebcO0TMM6uvs5Fomcnb17yypt3k0=;
        b=Nb6v46y2AEEUZE8KeRnKYN3dU5iTHbwi5e3JhcavZq6JCKerEdvkb6SsJH6NAXHf0z
         ZoDkIJEZadlu3OpUNVjblY3R/3uOlm0lZ0GAVsOT288jvbaT8gJO/xy0xlOPlReNAB3d
         gh2r83qz2HZR84wNhb1rOz2t5zinhljPq5P4F2eZLhVnc7l9Kq00I/8Z8/kT+VeP20Jx
         4Vqj/irKavJdXgJHs93BT2a+Li0CAq3S0YS7yVEyvcru4OUW95Fy/jSrOQPUrHlU9pqL
         mqHw/zAP7OLU72rOL+gYyzTbuv2Io1Vinh3y80KmdAU0esMqwL2j9ptEWQ4Iiqyl3Iqa
         bavw==
X-Gm-Message-State: AFq9FYI5qJ9nVGQKm2sSPJit5WMWgVN9tm175jLyawr4XEWncx8/z4S4
	+H6TyGzYa0y1/K9VAUgSyo6ZcFS+d38KJFsb1f7IZn30K0ISfvaKaWZKvQUZlHLEtGrvXzIif9G
	URiUTctie0oDO0jpcsyWLMngBXB+PYORFtWTf6Fj7yQWRD9akjfJAG7KMTXT11Sz2P3ilTsE/jy
	nK
X-Gm-Gg: AYBFou1xyBP15fNhJr1lQ/sN/EMc3mi1pzUWn1PZiqedBR9FuXrFrTSYragdzhqwDWK
	K2IHbBVuc6D8t3ZnKRUaYTzco3gBIKYJRELABIhKyW1yAXTqhRu4cpiewSW2R6Cdh2lM5eEU32t
	9KOdxGZsS5/cZKOeh8/kz2UTgJSH9DtjelBYvTJ7UnwgNod2y0xHHZnu2zbXi19d2GS2dcrILaG
	4BNqKYKHxc99Ql6ovvWC7oDYRCwKGSGM/ka28OwgAEJl1X4sw/grKvOdY+Y+NbwS9Ib1lK7EqNC
	EijxgLpfRpQe/jCH2JRkOxlPZEDNHTwGXGhZ2dnxv/TAv6HczDLXw9w6VaNc/xR/ftmNLnmAScs
	Kwxw7H/tXt4RZfWsPvLfuMhQHMiHshmOKZQy0wfbt6rbu
X-Received: by 2002:a05:620a:a0cd:20b0:93f:2e7e:c818 with SMTP id af79cd13be357-93f2e7ed0abmr614909185a.59.1792408389007;
        Mon, 19 Oct 2026 04:13:09 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:93f:2e7e:c818 with SMTP id af79cd13be357-93f2e7ed0abmr614905785a.59.1792408388516;
        Mon, 19 Oct 2026 04:13:08 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4256c790adsm211472266b.31.2026.10.19.04.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:13:07 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/2] net: qrtr: don't lose name server packets behind the
 HELLO gate
Date: Mon, 19 Oct 2026 13:12:00 +0200
Message-Id: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQrCMBCE4auUfXYhCaVYryIiaZy0K7Wtm1SE0
 rsb9fFj4J+NElSQ6FRtpHhJknkqsIeKwuCnHiy3YnLGNdbYltclZYV/8FOz8oBxnLn3GRzlfe1
 qDg7H4GIdW9NQqSyKsvwezpe/09rdEfI3S/v+ASFANPuDAAAA
X-Change-ID: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX0sFoZfQgMfp8
 gmI+ZnPGqd3AMbZrfTcpMsh+QYf6pHVUJww0epLWzT94nd97ZJspoLMVSpyQTi6K46g3r6GqtL7
 176h2/1pAZ13KpNbOF8ww3o2g75ZDGs=
X-Proofpoint-ORIG-GUID: VFTSkgRiruDZTkjGDmR5VedBouY6blDD
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5fb46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iOzWpaUfyYFiVLkFVAIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX4nhhh21iDal4
 A8xGSg1dUet23Nov5RoNRAQtaSxOTcM7oLrrGM+A22YD7j9IPoTF9iRI9zoQdPHRQn27nEGecFB
 rXp8JPBBGXf20xHUc2BCPOEU2lfO600aioDOyCe5/9DH+2bUkOmS1metnaID7c82iNYiB5wPGsy
 ZezlEzpmo+1rx049QLyL87s3jT9q+vjGV77JYA/fEk8KiwakBYbMe4J2Nvjn/+zx+BULxEo74Bs
 QBdFGA9L3DGFcHa04PJCUoyvbbp2+OoEAL858H1MASeHVB1KGrCGxl/pLNsQQjy9zrSvbnkVp4/
 faddB192AnsHQwBN4MpIYLV3nDFhrmQaYRdIYmYjMEltvC1Z8SWSPk6nC7i7ncQHxGl5Y33u5wa
 ZgW4bsmynkKlIDJFiYib5MyrDErsLo/EuF+1HdwyH+MWgWB8S1dIJ/IqgPgQC7DuNcKcoWvoeXJ
 t+22BoK4s3yDE77WHTg==
X-Proofpoint-GUID: VFTSkgRiruDZTkjGDmR5VedBouY6blDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register") the core refuses every non-HELLO packet to a node until the
HELLO to it has been sent, and retries a HELLO that cannot be sent yet
100 ms later. A freshly booted remoteproc has no glink rx intents, so
the first HELLO fails, and the name server's announcements in that
window (the replies to the remote's HELLO and the NEW_SERVER broadcasts
of local servers) are dropped for good. The name server then also skips
the lookup notifications for a server whose broadcast failed.

On QCM2290 (Arduino UNO Q) this stalls the modem in about one boot in
five: it waits for the RMTFS service, which rmtfs registers in the same
instant the modem starts, until its watchdog fires 40 s later; WiFi,
whose firmware runs on the modem, comes up a minute late.

Patch 1 makes the name server carry on after a failed send (announce
the remaining servers, notify the pending lookups). Patch 2 holds
control packets for a node behind its HELLO and sends them right after
it, instead of dropping them; data packets are still refused before the
HELLO, so flow control is unchanged.

Initially tested on the Arduino UNO Q (QRB2210) with v7.3-rc6 plus the board
support it needs: 10 fresh boots and 10 modem stop/start cycles, no
"failed to announce new service", no modem watchdog, WLAN firmware up
6.4-8.2 s after boot every time; unpatched, 2/10 boots and 1/18 restarts
stalled. Built with W=1 on net/main; applies to next-20261016.

I'm not deeply familiar with QRTR; an alternative would be to have the
core trigger announce_servers() for the node once its HELLO is sent.
Happy to rework it that way if preferred.

Cc: Chris Lew <christopher.lew@oss.qualcomm.com>

---
Igor Opaniuk (2):
      net: qrtr: ns: keep going when an announcement cannot be sent
      net: qrtr: hold control packets behind the HELLO gate instead of dropping them

 net/qrtr/af_qrtr.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++-------
 net/qrtr/ns.c      | 10 +++++----
 2 files changed, 58 insertions(+), 11 deletions(-)
---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906

Best regards,
--  
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

