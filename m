Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100674;
	b=VG6rfHfSmdbfhaI2+uLTT0xlNIHqO3L8GpBC9z26NwlmlCY0hAviKKYWkj882byNzYry
	 ipR0b4+VyNI5tGRQnmM4iVAgjqOuHvdn+FRHEkaYvL/oUuTx+i80UTeIqgQkXRMGFOulP
	 Map4l+0oqoAV0qaCTw9MhGg54Mkma8oAguABfO4yGufTqGRlMrvhVl3kjwuwtBMtwm0pC
	 izoDRAs4ymy4ZHOyoQAbokRgej3szfynchlc35WqJtQiHN8in1waOmnce3UDNCddXp50d
	 u4gmzVJu8/41iEUio/hsg34o0EfDCUxukn0MDziAO9aanHj9dy/3fE23I6piHYQ/dlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
	b=oaNJsLIAKMWvLZsoozQcu5gOfrAqgiBHhoSmbukc79p472H3RD+Z8dHR/pAQDb83UaTD
	 w61VTaV6t2xiQKiHt98qfxtMFXwDrBrCgfz/Md2u5cHrPM8VRRZ67BjJ+0e1c+gKXFuSX
	 4iOFyE9qzM5VtifOT0GUXj2XeZV/W9G89JcBiyNKV9skB/IMRQBidINcrpvaRknPLxF8w
	 R6+e+kWmfD+Hv264H76c5UxBy8goRzekVvrd+f7L42Ki8oyePrWG7eM4kc4XeYgL1uDJC
	 rqg6/Umc5P2hJBz1G1orat6frKnhlLxsOfd+MvtvX89Cw1TbIzIh96zFMAVVxfKRTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VT9U/+JI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2DRbbaf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984F6606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984F6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VT9U/+JI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2DRbbaf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJEOF8u1319526
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=++0iF9WZyX/JF7xCCfezhk
	lFThYEjJZaC0MbC0RIVb0=; b=VT9U/+JIol1dJh/nIKYyMkvI1G9SrhOf9so3hV
	iS9p+LAoXOkxT54vyTlWZPyc0T6qB4Q9nrpXlHmRvbqBBQc3OwpS62bCoD0Q/HXA
	JhR5u9w3Wit53h6TV2RfR4welYpvpemtF3eJaX3rPY3CbPhBwM6zdQ7krAxpespO
	Zd/aW6ZbtUt8Pjvv/8ho/mHUhT4XaNZQd7qC6i6LXMCjHfHKB1Qpy3EDQagFYCRe
	8F9OOPDkUbbK1wLxQD+qI++OH1YSNM9Vh6g+M0ag52U8ZtTQOI9tUeIe6+pr4NDR
	a37pNEBCAUGXoYnGkNfDcvsQRQxtm1ESX7O4ewqF+6nLHLjQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j22ugr5a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:32 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dabc6d5dfso3685679d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100672; x=1795705472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
        b=T2DRbbaf0UnIPSLUXt6eNGWqMX0EkAZOyr9ZZ4qDI4eoZNhc8y56q/yd2oAvSgzL5H
         q/d/9UpchSlEZOt/ZaIsNJaw0utyZtVa8Q0qGC6gu1Apoqca88rXJRVSVgDAQ7cFfkky
         5xQsO8cJSnHObu9ip4VhEuXrif1t2anTQ6zfIck0w25FdBlKK7lul4MeinwtfurL7Nl/
         OS2+nTACJkB4sOzAnWGZ5XcV2Sw/eerpXZTH4/mHc4lZ8xrljZiM7ygipDnvnZBut4lS
         9ox3NlHjs1eGDTzYr6qgzpOsNajGyFDpCR+APHd49ZqVQ8KmKSdqy+4gTKHsBm1FkBaK
         b0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100672; x=1795705472;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
        b=130oiLqlJ+gtHP3hJQNY1ZtzcnCKk7+oig7J3feRgVGXkPgwuskRvjd+Tf7zD6vtLU
         +YA3ObMQfI+InFgb2UtVUCtHD8Sb1NZRe6qO+AvkKXgD7NsIyJzGmVxPfqUd/C5QtmOi
         ysdsX53R3oc2Px+F46OahxyAIaaaZR6Y0VGm3uztretAoSDwPZHefKNynSKU+GAYAxy6
         WVYuaIr4hmvP5+mkpBfFs5RptjlbhmeKmGNx1UBV7NSOHPNlIMv3SNXbZyiiyUlsWNqk
         TZNsyQgxQjG+1YG5wNVnlXGyDF7pnemzzp7u2uHymWIs4AflIoQesYEGDYxfMPQYqIq+
         tx/Q==
X-Gm-Message-State: APuU4Z/paAGuYr6wczpatnIH0DWXfKKXRzxweShMTFA2dECNCvki/dVl
	RWlLktS7QkoaYskXZCjOpI8VC7gBXlYqkj8epLRv3Ad+87PkSDNtk00tz6r8j74TjAGUPxDBXCX
	bh6SG5JAK2FiWouw0OuwM3d5M2AJ5tHokTYRiusIeDzhCnoqRB6sBsespNAKCsqFM2XnuPFMnJW
	jM
X-Gm-Gg: AZFdTZeIczYguo0t6WH3rRsBBYurvftsVGDdRMKeuf3/ZpZ0fl+GyGH7Hn1ItCicoOB
	fzih53oyz8zhdsKqjvqIxQ/948NugA1qNK0R2Kmq8wr+vtNw6N1KPM/8LHoZFlbrKxNCbooQRgm
	g1Mp29vs6982R38xZSovOWqbzsMSruJtYrD0+H7srOfRQqP5So1XXzXJZQ3rtN74TNgj5Dbnavx
	aePbxnQTtSxS7l6YaFFnXalQz3wjsTLF1sjQsbsS+ymnHOP+2ALKqHuzZ4zzsR3TAvpv7s6vScv
	Aoi1Uy33GLKrvwhzblhtluvMZgugBzl1EIkmuF3FuhR62itDqlH/ofOiISJgp/0H97YvqTyMjTz
	qPBRM2rAwO/gcB2+nsgt99lzXZd1yo+pYPlfwx1wFgBKgzbD7ceirUTpUD4FU9q1NGjNO/uGFEV
	TN+jJG
X-Received: by 2002:a05:690e:1094:20b0:67d:bbf9:11f9 with SMTP id 956f58d0204a3-67dd3f5a9damr1872168d50.41.1795100671677;
        Thu, 19 Nov 2026 07:04:31 -0800 (PST)
X-Received: by 2002:a05:690e:1094:20b0:67d:bbf9:11f9 with SMTP id 956f58d0204a3-67dd3f5a9damr1872096d50.41.1795100671087;
        Thu, 19 Nov 2026 07:04:31 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:30 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Thu, 19 Nov 2026 20:34:21 +0530
Message-Id: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUP/2oC/23OwQ6CMAwG4FchOztCx2Dgyfcwxoyx6RIBXWGRE
 N7dMS7GeGnyN+3XLgS1sxrJMVmI096iHfoQ8kNC1F32N01tGzJhGSsBMkZvj7mb3FXJDpGCMlV
 uuORcGBJWnk4b+47c+bJnp19TUMe9SRqJmqqh6+x4TMq2qFgrKiPbmmzzd4vj4Ob4jYe48P+wB
 5pRo5oSaqNEDvVpQExfk3xsdhpK9Dz7MiD/MVgwGmhEWWS1Epz/MdZ1/QCKKnSxIwEAAA==
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1632;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=INChXq1vpYh0albQLEYJFLkXE2g1hDB7cFuP/mfs4PU=;
 b=twsJFl8WfgRmeqZAMp3KIlEyDduOCWgSQgEzksZkjU5/0bZAmfAPiopIEiooMjgaRFJ93RZZf
 lZ3Qy1gL9rSBiAUXaLbPeheBFxquGn2eoyPKRqjmEtV9VSyXzMto2Ia
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: 3jS0_-gEiMSAYp73R8OMUxu6txPfpE5p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX+St8woVdRE9c
 rn58AzrLwLpCSqxV7VedU8Uv1SR+udipEvsF3y66ua31s2A7rGHqng2IBatqjDcaz+730Mo+Mmx
 v6betys5Zt0Mz4z3XYLaQmcIFkyrb2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX/IF6cCJv/ag/
 d3TT1fADl2Rf8q8k4vH/FvpQe3YXGMFGwQZ++QoMKTQ4JDZfaFM1QF2uX7JIi4oXfgfigitZTzK
 Pp0bgfL6a/kK69PdaYCxuluLS7sEj+qXA5PIBkAqdvVlrlXK6oSm5XBDfHrzoLpSsbILOi0v+Ts
 kvk/4Yf7QIc3qdaLNZlNcMZ3PipUO+x6KRtOStmHpsHr/2+bUvc/nYnZ4Q9VnB1q8ZIAUWtekdj
 QHtaqxCRrZ7Cjc/QWFOCgZt32iffxs+Q6e06kLcSOIZ8PWkUU5VwrJvHXIIZBa33BM9aJ0oBn4j
 7WS6tJQKWZH0Jxs30KzjlNHMMOXPMh1Y4X5O/DtYGijQE6wyLt7Mfo+YU3vKVw3nK4UUT0Zl12q
 Yp9KPzGn+fBAe9hrzUWfgaxykVAbUCtlN9Vb5Wg6Mb6J+yh0gdgCDD+o1Xoq5+oa2nFiJm2zlUk
 00hTOvVre+wShmuzK8g==
X-Authority-Analysis: v=2.4 cv=YeEodARf c=1 sm=1 tr=0 ts=6aff1000 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: 3jS0_-gEiMSAYp73R8OMUxu6txPfpE5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v3:
- Clarify the binding ABI change and why the old port@3 ABI worked - Krzysztof
- Explain in commit dropping port@3 does not affect in-tree users because
  Glymur DTS support is still under review - Loic
- Link to v2: https://lore.kernel.org/r/20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com

Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use linear CSI ports
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

