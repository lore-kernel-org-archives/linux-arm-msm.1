Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE522853E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 03:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234821; cv=none; b=YbLohhrfCfIEsJSrM3e01f2Sa5wQTifoLXcdNlQ8KtmrHRIqlfJyXI1+9rhQXRoEEWE6f8adIrVAKTg1gBj3Wvgrh8QgUjqgnGkRku6nYGTwmTxWTy74NhgPQ/gKPyUE9G+Vs2oPnFIKj3HWhZnvVraDWHqGm7Cu9bm/0BTM0jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234821; c=relaxed/simple;
	bh=ao9W4UafP1BG4g0Oeyh5S9QeyOeCRkfK2dC338i7aKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNn8qGNtBcn2Vdwubbk/d2I6QFS+tnioHrbbYiuDnweD8rdmuy6gcqfsjw2abLbuWUHzXOFGSlZj0e+5qAnQjNjVRgQ336xr2F4CZByiqGqXogxx3p6LDLu41E0wNIzlPHD5oxmeoN2TOpgPbpNEKv7IHI6xWCbg9trkoYwx+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3/ovMn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiiddZpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3/ovMn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiiddZpP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68123Z4g536136
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 03:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipv
	rJDvshDA=; b=T3/ovMn9+m0NQPNYGPdH3JveyDK3ffMQelyaGmr8pphSb2duO+8
	Ghfjz6ckaKBdKWYxHysM/P0p1uMN/sbH9h6eOynmeqGtqmM7xHdTlX1ULf2Xpgv9
	uZeGz8+T1ttxiKOIPXMDWL9mZmtVedM6w+ieAmOUJv+i1pq564Q9F6aFi7+eRDAB
	Dcs4JJD/eGu01ij/0U7maiG/1zQptQCMFsZYUhukP1pJObnV6D6jt5s2I9mKOvRx
	sBjTc97igRE+lenr61IadTm9mtm/V24Y/5236tJmgsZ//0aAv21fxVhx6yavXpep
	+bphkIa/jSwlT23+x2AjqPbCfK496awIWjw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8rby0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:53:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so740398a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 20:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234819; x=1788839619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipvrJDvshDA=;
        b=LiiddZpP3a1ePth84AFgnHkDkdnwk076sOumlmbomo6umpczjjvviuyxuKrS7IeRf8
         dZSONKhaKvKyTzpFCJmvtAaglAEUhQb2utrQQBFchzxWlNRLJIfjBkuUPJnssoXxPquK
         LMA5C3QgkblhBH1jPF/+Q6JnULuGxPInKUEJKFnqHAzIzrocX57dPUQt5bNBJYm/+y5w
         ePe1BEdQDOLlgk0vhGOQRlqKyU4IHp86MyjjwND0vJVJxBEUeP4SDihgwQeosGe40eK1
         w89n+CBrZGYrHhqSBachJ7r/uWhBKAXfSR1LncNipo1AGmAcLy7uuSymk0Mfs1Pf10HO
         YoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234819; x=1788839619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipvrJDvshDA=;
        b=DWt1m+9+Kr9YsnKO2UDfMZR7O8yOGcESfaPxFXlcaDXTIHirmskHOOrl3vPJvlVC9d
         i06VRSXuQU8md1HV1ub07gRyGNge4TmC3oB84BrAuoLwUVIaAqx2yFPY9iCX0lPNvvU5
         P3vGXa60+aopGBRWjCkP5wmCEM/Bkc+3fOornKKMei9lKydljkuMT30a2p1Kr46T9e5l
         usNuwMsJKQq2J4kyZAnNl2CnD8W8ZC+NrocTQcUQ5b7m8wRsl1DYnqtXzxmi7Kyjlhts
         vkmd892BvpdH25Gc2hxE7L/OhbVj47rWwMl/2OEOuZEYEN0h4VcDcAJ/7grIlIHeJMcC
         zlZg==
X-Forwarded-Encrypted: i=1; AKwUvByedwhNs2n/cOO1MMk7IB8R6PyTLLAHLlY28ivWVwyC4FCsRRBI0WbX8V/6wW8Gq7dN6ug/P8nCzMmks4au@vger.kernel.org
X-Gm-Message-State: AFuF++l+2FlXWJXhJ+i7FG+GA+3YjwBu/c2yok5XCSDp01pN6UBHtKUF
	0g6JwGrQWSR+gEe+cGVXjoGAU05PP7bCFgRLPqvLQeH+9eX0g5IVglpypXXjiG/O1yqAle5Z/c0
	yCnVL48JXPq1ZTzosi9hC9M41IV07SZKCoeeASJ06JpUAJw/kaegOT98rMrv9CXe322JY
X-Gm-Gg: AYBFou2/PGTNiyCoiOX5tszUAGdM2VzClS6ZXhUl3RdEdWJBSNjqVfWtFAU42ABz2CE
	vdKBE/br0eKhv4ad3RX6sbfvgd/FE1URL+JIZEpLLUyCxoygMm98Y5hbizYpi1SyInudiDnvKsI
	y4Io4N/O4SrzQdX9VGUOq114BMxCYSD8pMpELywQKD2+sqyXm79nzdH8g4vxU5WTc+fHljft3GI
	ckSkMi3ldCdmOO8FWjJCZTOl9EjxMH7FMMdqSEcsiEbJgt4JeMFpcyYvR6ukGdag5AyhrleDU4h
	aGbFZp+dkNVAHDBbqIUIbQW9IOwF7YVynISmxGOfJ98FlVu+Y/bEweQ6atkCU3fAr2iKOr+5XM3
	Dtm8KVoIVe/I7YLqB3AYs4FLspArSbCAVK5ZZqSM8fv+uQvPUDUiovvOnWl1F
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr23318492a91.21.1788234818743;
        Mon, 31 Aug 2026 20:53:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr23318450a91.21.1788234818326;
        Mon, 31 Aug 2026 20:53:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:20 +0800
Message-ID: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a964c43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KtG9YyVjr6Sm7fKX5a0A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX+5jWpBz7NNZZ
 c7f//FyBqaTX9EhV4bj/gxntqWBPH7x2CdC+HyZgtoIo0vNcyLWS5Gcp7ezGilSVhzimFs9iBsS
 swIGlNNBMLivOBuVHiLwcaeYnBN6sS7vTbSyGA7s9dSfCtb1iS4AnH2f80BoSOY5h6SG7apEms9
 sOyUcwHfQVEpd39bPNXFzT+X6ebFL81XCo4gK4zkLrvpPLusVMSm1a6EN9f/myMUDh+vdP2qy20
 1u47sBVebboSPErMnozcN2AmP8oQ8g/ljHMLVQBe3fFGiMTW/K8C1FXgefCB2rn5rav1ccE1UNv
 x6ovE35HqFBBXhy2tKweqsbXpNi1NDYjuY1vGhEEs27j0DesAcnRO/ZzwQBMbq6VYXi9QdHVvMs
 Vj90uWyUNKJuaFAc0nCMnllC4fXEUhYBizBjJ/3+29+RYOgHHsuInZQpgDPJYJXF86OMdgBkrhj
 8VlWbv1IjZK7U2JR7GQ==
X-Proofpoint-ORIG-GUID: SFw3vS5EXhFM_5aO917E_y4mU1uih_iR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX1rJR5Wr2nynB
 c1q87CsKotGAw4rDFHIWoJ8Rfy32auPzNL1nhNnBUBnwvLPAZgxB5FV43DREsrz+1F+ycjUnaNX
 obcIqB8iDTTdJHl1dX4LGk/KLRSX23A=
X-Proofpoint-GUID: SFw3vS5EXhFM_5aO917E_y4mU1uih_iR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010031

The series adds the missing secondary QUSB2 PHY reset to negcc-nord
clock driver, so that usb_1_hsphy can be enabled properly on Nord
platform.

Bartosz Golaszewski (2):
  dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY
    reset
  clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

