Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425031;
	b=GpHhgEcYWBvx46ZEsPvIQ08dX5zDa+91ZFFqpUCT3K7nJZlQj7TEOYC1GbzZx4p6uYp0
	 8sOBavGGgn431UGZkN2wbOFK+Pu88oVf2+rx/1MGkPmsOC0bengE6+zf0yN35htf5db9W
	 O0vcowgtjK24FaeayfLk14h92Pi8I5ljCny0mp3kTKiLK2muw6U/UaRvGpSUx0cK4r0M0
	 VRpK3F9kUedMkPyAQDROzhdHGkai49epthPhKw0YnL1ECHUqOsmZG75g+Jo1zlZ1EV5pC
	 fHrdZsLGivXLx3nuWnzyMwhpMYkkFIeJOQIW1ZGYuY++y6iwT7eo11Pbw6wsrrIwdqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
	b=Cvblam6kUUSsOQrtNf/+KOds8hR/DanqOyFqKBQWt3t7zbBgMbJ3vc9ozz9HvSttPzoJ
	 xX8bor7eOBNWxq5Ck3qk9mVyWXq2RxMW3EZ81UM9GHAW385d0s/zz3pCSMi63+D28v2vP
	 J4chqfy5WqLdCgqBtHwFph+yoFwJ7rv87GOPQ7sN4mb5ba+aJ2hcTL6RRHFZk7p3BZ5aC
	 2cS3qBZ3e5Kul/MWYTmAlZpIUkR5QByi9KEKCyqGCyCz91EHWQBlZSYGoCTwhgyDMgsgN
	 GwcbLdqPHe+7BpB9NUeGANIdBxtxDk9m5DBlGM0h8VmiQt/9+IxK0Hfl+cf/yz/01pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gD4o9E+y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E9606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E0E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gD4o9E+y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN69Cfq1011315
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+
	gub6KOJ8=; b=QTu8y5jPqvdgr23dwcsORrMr2kFBYxoTCkR5Ob8HhGgwjsJqZnm
	BEK7IPo4TFAuRNyiIOFJ0DIMJN3naxKTAWcYallI73tFa9uOHIzaADMRjGQ9sQj4
	Z+QsKUDyiaRfMS2CLQ8tC3qEiKs8JzQqpQmP1uqpxdhDtJRIjj3SEVHgSRZgfQUY
	bBpt9r8j4CRP7I3D/I0pGsDLcKKyo8uSx+oxyBxYAhCP3d8dElXbp8DlYCtBsnkk
	smQh6XImGky/xAlmiUTvRnocH6I73U0kgsNkYhpwwZ/MqMb5b1vHbIB3Q3gV3dG0
	HgbCDPKB/xcofnIiewTqcPnl7+YAaz83Rwg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh0mcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso5766674eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425028; x=1796029828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=gD4o9E+yH/5ZSeTVDjfFTyQPZGEiT3c9P9cox2De68L6LOFqWCvHAK+x00SMu2VVfq
         eDDoB8qQqSg9GFwZ4rTqtPeT9mNNtXIsuLrMuptACoUL++Ikz9/LVPlJ5apTasXG7wfj
         2MtLFN3mv3DcLv/5eg+ZX25Dj4wdnTbv0c6d4hAHJk5DHcN1QNjpe/uVrB3SxUqQOBWW
         oYTcwgueZz1SIVA5vZXQ23NHSM0WrHY4++JSDhZw7RyySN7a8GhMRCgkDXUJzijShvqV
         /ITIHkmWm68lo4+Jnt1rbuVbEw/dW0CkNZfF8jYmIx7LAhU10QLvr/s7ksGVuBj67X2w
         hpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425028; x=1796029828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=hnkZOZ90wvMtnT47DjKDczXTGne6fZRozoOZVj/9u0MfCPe2+b6TCIjCH/Rys4dQ0a
         bS/HSZcnhh5nlCUa1cf5VA9XjlYvlP2ZSLsMi5r0QER6hYnARNTOyCPavGkg1R/ajUGf
         0wroTKvv9zsXGVUEk0PxOXHYIFp0N2nKhPhyfX2A35j6k4mefcVLufbblhPiLpy8fgwb
         0+YVY68n1rrS//LZAydJXAvGPRXjcE7C/KPZeGdHLUIOFaFIcsC8m3RRFtvBYFBdNkmx
         DrSCDfTOvK2pC0gkoQV1QaCoWwOOHPO0hJjl/lPOmQPDFPW+9Dieril8bINcw26BrxvW
         xVeA==
X-Forwarded-Encrypted: i=1; AL+hErHQ01RnDQ2QRbKbirFKBu1H5dkZq3oxyCk6UrsC0/jvOYu+1BejW1jMxnAbqhd6Bl7J2MUZwLvpz8Lz53sp@vger.kernel.org
X-Gm-Message-State: APuU4Z9iN0ZMRZsGx1yCHmf55HFA9oTcdaEHI2+4QUGrQPG9VImtv5+J
	f7slkgWRvZNifauQmHHdF4MZOra/wNdMZv6/our4dQBx52Sgr73X95aE7TrLGaaTpiORsPJBsgY
	R8yTiz6dpqHqxVtGR8pLIuoJPFGNu3dA+8yGsIrkyupkxUip6tSOqKBD/rO6BgnotqmkK
X-Gm-Gg: AZFdTZcB3JpYDKUI7dvVopD6uPuT4XShgwUNoiX0l2AyNzx9X7GDDVlcZIcDlnbjgpZ
	U0lJ0g3OgCYFi0HvLjGZ/o99/nAUK8gxgeGudu6IGQPmCQ7dQ+pk+OrkljwjRVo/Lzrc9rRvPlg
	KF2/nEe+VUpB2LHrS1WGX1OL/fSPhu5At3IUIkzfvrqpnsjNKB7X/AJBoM1I1LPPXXr3AF53l1g
	PTzXuotuQUJfXKeQxiqztePdStkI0gC6aC7ilTmo4B6LQuKqow23+8UNL9hBDeo9IrSQrxCEtjz
	FjCoYRJKZ4TyQn0uCdEhAc/8qMyIGnObGqLP3FqCiFSYOQzN8f9LdDWD/7JUC4ZHWDvFR7d72DI
	cc9UDvBOFGwdnuD3dgnzLQUEqz2czignanbn9UiBTs4ONJs7z+5dYgn0uubsf/e3aIVy9K0aw24
	QBqA==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6162008eec.29.1795425028437;
        Mon, 23 Nov 2026 01:10:28 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6161977eec.29.1795425027969;
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO
Date: Mon, 23 Nov 2026 14:40:22 +0530
Message-ID: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b040305 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ho7CR9d4k8WB-Yxh2A0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX05J72iU7ofam
 krGZbP5Z/V6IwvnBNIoDLTF1mCvuF38oihtwpBoYsQ+IUR8P1kVxlmeOzDBDNUVei8NWfHgDGJv
 qnE/b/k4yJeqq/Pj/R2Wv7sU2UVm788=
X-Proofpoint-ORIG-GUID: tDGnkVQArRlWviM0Hx9RDvjhd8tz5ep4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfXzA8Wz/iEsVnE
 UA5BGW2Ghz/rd1jYa4GvE6+2X3ARu0tX/dKh9KrSRPDI2Fc4Zat9M5hiqlsT5Slq3aq/3ioNJoN
 jAWTNwShqw8bihoCNfaz4KxTQ6gkHBBawYDsLD1RLgJpJhvbTk8uU+efSdJxKJX53rhRyJzCZt0
 J8b9HnDk8JsFgxjwi+OswyaUG3mpLNgCGtagGMyAxtjexnNtgZZjA1gOqPI/Zc5H+Z4ByiYLrY6
 3bflAAMZBclBZYmPVbi9T1fGrrGN7/mEdVT/7ENqguGp/khPptqQOglxPZb8UPBxXtXFEfCv8du
 jTeVVcBUqUSmeTJoQpSSQW7MGw3zmEGP/B9/2FByMakQ/zIBljXCsPWD1WwpmV6ko22+neaKEj4
 5BPiPkcvfaWPbCHW8SFlz3i0LjFWbvVyVJZgBYBPuXrP3HOkaRQGqTsXVOviPX44sSBuY1UGDOF
 EbQQGlv/CkXqnZgFfZQ==
X-Proofpoint-GUID: tDGnkVQArRlWviM0Hx9RDvjhd8tz5ep4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

From: Akash Kumar <akakum@qti.qualcomm.com>

The CCGx chip has no HPI register exposing CC polarity, so on boards
that wire a sense line to the connector, pick it up via an optional
orientation-gpios property and report it through typec_set_orientation().

Patch 1 adds the dt-binding property, patch 2 wires it up in the
ucsi_ccg driver.

Changes in v2:
- Reworked ucsi_ccg_connector_status() to return early when the GPIO
  read fails instead of wrapping the call in typec_set_orientation()
  in a positive-case conditional (Heikki Krogerus).

Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
  usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../bindings/usb/cypress,cypd4226.yaml        | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 77 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)


base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
-- 
2.43.0

