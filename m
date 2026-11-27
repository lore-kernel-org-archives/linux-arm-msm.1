Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811634;
	b=zMnNGibB9ls7d4AA4hyh+gYRVJ2At8uLJlGST1tZjuwhCN8Ln/u3Wx2Tlql2sKdPu1Sa
	 7dhYMGsbVf8v3Nd0ZqYx9K9svZ0ZldsgU7blBeck251Z1vj4FWpCh1wsccXt63oNECLKY
	 eHZsdsEwXXATPLyAdeXU2WSbekqYzmPnw27Uf0+gTUktdk4ZWuZBwvfkXpXAt69kDk8Sh
	 qMujVRzjvLlVPH3tkMVUwey83L4eCXIr8L2Ti98iMv168O0GuxNP1/ltHjYjnIzx3A2It
	 l0lflujtSLa/om/k9FOZyoPOBGzPuNR0OGUiXtc3ycaicIrJfeMuqrGF9GCw0liXWWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
	b=xOTFfie1gldO0MBczhq6KqZOlg/5OKT2okAKHd4YswxCwKlh25s16bN+9ddcFz6lILBf
	 EkFE93au72dKBsD9gD5TVxXg9baIU8/+i4ocq8lWgzzgXAAtfszuoumDeTCIIu2vq6vfQ
	 gHShF17hm/CzPk0PE8KA78GYFY9sm1dUnpWy0kW1q5Si1M6sTdXyw+jMmVmVEAPmAfDBs
	 s0v9dlt/Jh8RV6z9e+KVjX6DNEJPzef1/tx5vfHIHmkYAsfGHCsClBrBIKYS4cGx1QdSh
	 Xdg3FALRL8r8YITVLcMNwH46OCKCmbjM8hqVphpzFEHs7nu/i2YuzbiweWOfLbNGDCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuuoNibx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkteGFQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BB606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuuoNibx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkteGFQg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRbi11381601
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=; b=fuuoNibxWVUUBiwo
	KKdAgXaDFx346+48fl6jf/yYRBSHxXzmSVdTRM77QYnK5yUtT6L5sZGhkVRnfaaU
	MsTtprL/SAeJqZdZV+toq/Zr6TL3I/ksjY07p1bcSYp+nGUWP6iS9bhIlwtPUwv5
	aCrVBoMVdpct8IYBopQLnsAKbFwKs7aaRWAzXEcYbngeeGZUxsVZKvVDWXcGDxCF
	Z67c9tu+wNI1T/sWNpwhb5vpWfQlA9QgF7EVEf1o+vRt2a4iNA6opwIm537GmU8F
	l1qbLoA0phvLd+n1WQZEdgfWzu3h1UDCTlBSj8SxvCngFC+vDrXDWBpsjLHzC077
	u5SHoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s84g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so1247821885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811632; x=1796416432; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
        b=HkteGFQg+XXIibWQKhGtlbgzrRb2tK3qhU0z2RENhEXYN0k216VIUOZPiR8COHPMJ2
         SPdGfgBnQL86xou0JLmmstM5uHJbFIUkdGiJR+0erO6mZs3sdIj1xwP5AD01nZxlgrZX
         G4M5ciCrsvJ4hKjHQdGvUzWa6+MXAILN2pQUqx6k069gNSs85jBCdot93nU6q1cDhEoI
         TInHhRi09c6rerQAyNFcy0Te9RIcSYtMvx5hjmXyyTnfGw8NHyZd2Zx7U47g+aOUEYtZ
         QqyL+LRaUJmIQm6Am6eXLzUtmQzJnzBGBAltFVIJWFJt2C+tpNcrEA/LhpREJrZUBffm
         VFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811632; x=1796416432;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
        b=WjlMSPcPqJdrNQd7I8hGyJDmG/Vd45ulu+EnDoB1ABCKEKgSaX7UX1srnrqiXPg8Ti
         UKHtVQWPmTQqUaqE6zcx9ip4wNEOvwHfrqiNBzFlKAIYyf8ww1X+bJmxo+1pRGEjW1qP
         Glp1QHacSDtRlLsQcVRywZc3gofHbiae7pva4gEdQI/2FGdhYrolcs/Lv/wepuQCSALN
         P7oaMU7v6VQzt0D1RQy4X5wczFaOgdPtkxq/Tt07nFV4TYZhaxTQFV8UkkA6DKMDCOl0
         A/s/Pi89Ba+oCKcizx3oRyG+uZLNRtpkoaohvDcI28cGVTlLNC7m0W793R0K7glXQGts
         ANpg==
X-Forwarded-Encrypted: i=1; AL+hErHd095/XaLfzOBy6NcdpZNDOLcVWuE8jEKFsXK/21QKDikWNp1nk78uYQPGZQ/+yDSy/lb6e2f/1INrDsFf@vger.kernel.org
X-Gm-Message-State: APuU4Z+AhphY1lVxdaJG59J+41iDDzpsdTGcGezVwHuDcedRTNQYAJDk
	AS4brddpvDZI8gacCEFk7Qw16GsxAuXyNSl/umFGwqx/4JPiBLgT6wxPF2BdXIMuQTDy0LeJd9G
	6BSVtUWrKaGW5uedko6FsYMIROGm1xJVFlcEPI//RlSl8HvGKewA9X23j6FDOT9o9/NJL
X-Gm-Gg: AZFdTZcoU0smds2WwUS+doCibuT5rUXgBHwb+D0BNac0ooYxgiQ6swY5TmEOYuxxkRP
	QJPxAOCVR6Dl9dQamf/U8BPrHvqZfFvi+WW2fk2YieE/m84NVJDtsJJi0Akv53Le73eoslQYw5G
	u2n5hC2CySv91xbYc/Ut7a1s70V93QyYjwNF/H1UT55w0p4lr1NE3DwwQcbO7TcWxZU0SqHcYmq
	f+yHv/WEPVlr4rHVt35bqsrdRUt9ERyCUO5VvD7XXz2TSDxfErMYQoWFXsNrs9aFQfCIDHJtmbE
	RaxaN9y3p5lqeU27uLOiejXtG4UIdXPWfbT7cy4xtRhypmDj6yZoAD6pYrdbKMYuiAeynT+Njuh
	hH9J7lenqieTLJ/n4Yd5zQsDb9XLEhqNPYs9aOuKhiABwW5eSDyUPU+Ll70V3Sg==
X-Received: by 2002:a05:620a:1a28:b0:93f:1936:b20a with SMTP id af79cd13be357-949bab284f6mr4399631085a.76.1795811632313;
        Fri, 27 Nov 2026 12:33:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:93f:1936:b20a with SMTP id af79cd13be357-949bab284f6mr4399625985a.76.1795811631855;
        Fri, 27 Nov 2026 12:33:51 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm48338546f8f.32.2026.11.27.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:50 -0800 (PST)
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
Subject: Re: [PATCH RESEND 0/2] PCI: of: Skip config reads for disabled
 bridges
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        Daniele Briguglio <hello@superkali.me>, dragon@radxa.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com>
References: <20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com>
Date: Fri, 27 Nov 2026 20:33:47 +0000
Message-Id: <179581162724.3905807.13798536034754126199.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=423;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=TZkDGwJBtyA0TiNJhNB/OSVSV/aagdKBXEGWAdK0OLk=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCektwUucylrVH5BWh5c4Ud4McwsPdJqTGiBl9
 dnw2xSBuVWJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpLQAKCRBjTcTwaHBG
 +DMWD/wNRZ+rlpDvMQQwnU9WtQcj8Q8Bg5b8dB2Yw8r2gPvmqD28DZeiYtjDTPWIdufB+iqgz5k
 08Oy0/zegQmPIY4RI4Chc3nJVaJXm5+Q24F1IfX1gW/g92ofustFieS4e8CsLo8YKOZMPlUBI0I
 lfXJlQqibG/hp63ZeYoNtwEJSjJOwU01etsgdsOJUeZiqcw1Q942oaLpYAK14p+Tl2CGZ5n9sNf
 kx8pY0Gk9d9JorphQkOYSN7zU09LaCTXnb506TBnvr1WQd+KjFc8a0DbVeEn7AthfMNExY/E8su
 E4apPcjKnPDstI6cL4Qa3acHbxmGaXXR5phfOaWJRaHzZQIoj7SariTGgq1VS6MSa4EGII15tZT
 HmYyMS9Ias5gBk4D3ngSRwk+y/9CIksmiyB1KhHbCo4YVwkL82U2vPd6gdqi3dsA7dtx+8gQr3X
 l/IOARrDpbLzhjrWkZrcmxHTiUcKmrq4CjZNRlSS3IXk/NznBYaR4GnSpJHDqrEkJZZp3jte6O1
 AV6n2qC+eoaN1ODqBIDCLh9wSBS1FdU+4dC6rK7WLP5rXwl8rqNohrGtM/izCvEtXEeu2fiOQfa
 BZysQQPlK6osqHi8VKGKaPdL5qkD+go0wo44qHrINp3/xdPCnDc7uwzFMu2jpePgCZtKOSGiV73
 HIIHqY3tgukda8Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e931 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=Rh4h1jE-l6Tb1weBNBoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: 9oyJ8QpzNKAjXI6RiWYS_VuiGn1PvqTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX7W+TIlh5VPee
 efHC1y/+M2veonAZjLWpcGNFyY+tJ6eYmtPekIYUwfNHFysnz2xcj9noghCnVv/rcfNKIX/cC6v
 KDkeHd+ghN+VJmdQsKo6v3H827n4CxkY5iHgh638kUgC5ZBQGquQgHYnbcpIsE1mj1om1sY06V9
 En0D75b2CnnR6PHbcEHGVEH/FK6Rg1UEUuNixXCMFXXiL+dE73PZLBimpBHKImgLpyZE1V/HNr1
 DxOw8htx0nHPERv0wgug0PQ5ClOaoOgWPOUrzHMqdzZlfoUEW+42VN3G0S1PdfjObLQhPJzf05O
 ybU2Z4+ekN7iOH7cBxwgc9sS1Xjv1d2YnedHp2tNe5XdooefboC3XGbD7wUirA47ukg5Ip/QemN
 uDSbvbtdWfthOwcUKM1yoGg7air1pwecW6d7BvuJmMveXZvx1vUJkZS2RoJSwaXmyGO4NI6sCaU
 gZmEn+4Sv9SyrRTrWrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfXySrjBQcQJKV5
 jUt5oO5xWlaJ77+BF1nIg2J3BKzWL+q8yoPDN8Ye22ppmYboNZa/LlBQlwpcEaQJLjc8hz0Clj5
 iir+Nhr4y4QzNbqAHD33O3y4a0XbHR4=
X-Proofpoint-ORIG-GUID: 9oyJ8QpzNKAjXI6RiWYS_VuiGn1PvqTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Fri, 27 Nov 2026 19:49:31 +0800, Xilin Wu <sophon@radxa.com> wrote:
> PCI: of: Skip config reads for disabled bridges
> 
> Hi,
> 
> This series extracts the PCI change from the Radxa Dragon Q8B board
> support series for review and application through the PCI tree, as
> requested by Manivannan Sadhasivam.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

