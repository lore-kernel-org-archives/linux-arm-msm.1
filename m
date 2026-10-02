Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3C3009F6
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946199; cv=none; b=kalvdszxkhVtK7Vwyuky6lUaWlFc8FWPvh17YaLevYw42BlNGk9QTYDLSTVMarjeTq3b+vqwKnH4wCeKy7RwQ7crt2ok5tBzJMiyuFwg3H5Po/l1mGJBIwjtyt+eZYtyQ6ZKq8TLArgVamdD0Itqj+0fymFsWQHqz3CXcn4Ox2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946199; c=relaxed/simple;
	bh=GznQWXxSPAllIQPCRhHQgwUrw/Nqi/4iAERI4dM9788=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZt+BPjm238ch/mUvlPchXuQIcL4FvGPvgnwFuAFp4wwnpfjZhqRsHwqZ97Cwobg7TLZK+F+wefL3A6317rQ7DMxn+hCVkQEycXKir/NgGfIBxtjnbtQaPXmOjUSEV8mpIl6Bz/hjuifzuqDK2CsefsGvK4Oc9NqEGbhLAtoJXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iw7Uws8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGzJ7xjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iw7Uws8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGzJ7xjP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nqpm3935820
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvHgyI/vDTc9VeLULZwinY2vkdB0hcnz9EFHVlYGik4=; b=iw7Uws8WQRVZXGf6
	GAL2QfK3ypCOQ5GIDIQFsLqDpe9shig1a0K681F3bTD2sYiuoiBY0X9RU80C2K7E
	hwSOve5OTUDX+ZFcb4pELWZOKhFRcu2zVtigj8tRg8m+SWNKx/es6TN61chjs5aR
	6gmixtloHFknIeDWy5uwWfHN2itixHSQf0X4QvXuJGIQOCnOpCstIgSMTNfySlc1
	gD/SS2pZOr16Wxch5S9E7mFo0553J3GWL4PZ6yTxmNS0IfxblBKuXfSpBip4runh
	ZGre/y09m03S4hKh0q3zQCMql7SCtYf6EKG4Nb++nOlBR0AoWCCj14EpjSwGQh3P
	W4KzPw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeb51j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510a481ae9so371042eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946194; x=1791550994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvHgyI/vDTc9VeLULZwinY2vkdB0hcnz9EFHVlYGik4=;
        b=fGzJ7xjP5VcTT5g0mTvGnCwcWXvXW6e0e4qprG+Y+6HSQQmiiviuLAQ22jruvMIBze
         +7SkH0R30Zc1o8KrfG+2/0/foZCH0FFWNmn5g6IaD6taTJl9Y6JdJKFlrj0yfaRhpUFY
         Jat0UMyu2FAGJNuXpy+HIhGc8fCc94q2wx2CS1PfxS7JpnMObHOMt6zeP4vN3gbvpF3M
         27R+jpYjtIXxi9JPB43Ho83So2JguBWgW31aZmqhPiIa0ZNOHJFh1AOzCzW6WEFJjtDF
         2Joy5YfezhAh9+iQlcLc1Zop2DaBFYMndZ3X76lOI8VkB7l3rJ4v1qB3LtXjsG0aYqoQ
         njkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946194; x=1791550994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvHgyI/vDTc9VeLULZwinY2vkdB0hcnz9EFHVlYGik4=;
        b=y9uYZZCh6lTZRREO58rMRQLhhyQJuqO7OITY9w9WmddqFz6/x2KbfKo36k7+RmbNgi
         n7z5XccdsnTVm67pJjDR+EXldrgsCv9FTv0FI/lLbJWiOIw+oWCRGoa30lOD6IFDBvny
         PfDVdPD4zvdaWZr8EeGsfTtqqGfWQDdFy+McYzqB9/MGOjWtuO6+4Mbx5p0yGmqt9j6u
         cQKwXeQARX6THzd8AHwOSpdpnjwOWwC7QXweI4lDzWnW2WYWmS03zHPSY7BtMlaGSCaq
         hcekUzqmmdz10uZ8er6qujCkaZHgJa811CovOQyNSejFO8UA+RIw0MV+c692MyPGsCgQ
         yzyg==
X-Forwarded-Encrypted: i=1; AKwUvBzvvVRX8PBcIUZKcy4pTgaxhHBGpqoxLnjguzWqoCyioxPGW0VO8MJmBFjBZNV2Vf+XrZ+3CxfN1XCPyqUn@vger.kernel.org
X-Gm-Message-State: AFq9FYK3sRCrlh49WG1aOg79zVu4QXmvZTTtx3pG1ZpxMSratqvDW5l2
	56IbvWHw3SyGKoZYUwUJt/VELDmAYpwUoEdorPZEcQBCjbNDuP4U4usx6/T5Rc2H3SGcKa8X+Bz
	oUlGvZSY9YpZB5jusP0XffkuFXOSbBDtCpRBONmfeHOc6G9yp8y5SZKbIAAMHeySvA9Rp
X-Gm-Gg: AYBFou29PSD70x7H+e7Eg4sHA4fCieZayE5F5z/N2g/1nZDlSQydDkL14ch5A47k4qz
	N3nxLk25da4T1BcoDE0U4KvfGWdTLlDnOEIleeaXp3H8ShaWdpLdvF0QOzXgnDQQLvitAj201oS
	5jdUVdxIsOmQ/H5Pv48U38fkOXeKB0MDhdVf8cZYuQq98kPo9ClZAf7gEj1NlIddivHet9jJgma
	RQW6VRyXNGDA0KT19muXC8miYRAdvBvB/ZkGtwlosttNQYBvkKGJGTp3YIoEA++CsO/YPDAGhwz
	2kEAjtraTZzTkioN7WudnQ2WDT8nkaLi5sITXFIKFuKa/0o23V+UsiNAgQKHz2cD3R8EazoSsCS
	8aBRRD/o7+SJ/yXktZst7519sTGAfWwyweuT8w72NKn9592HfEK2UhV+QpD5gEz5A5bt3pVmL5y
	5kpjdTOvBgo1HCDCULMRM+XA9YkdbePnbn4g==
X-Received: by 2002:a05:693c:6391:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-34f218665camr2857286eec.34.1790946193808;
        Fri, 02 Oct 2026 06:03:13 -0700 (PDT)
X-Received: by 2002:a05:693c:6391:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-34f218665camr2857236eec.34.1790946192896;
        Fri, 02 Oct 2026 06:03:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:02 +0530
Subject: [PATCH v2 1/5] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-1-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfab92 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: epF0bDgq9c0YgN_16WyjTOWMVzlCEK3a
X-Proofpoint-ORIG-GUID: epF0bDgq9c0YgN_16WyjTOWMVzlCEK3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX4KdCFDxhRiZh
 lFDC23yUvSOSeUW7pR3pDrLneQEUNKOkqQrc/+xuNannPYh+sEyAq2PiJXpSk06ii6BiYM8nt70
 jfd8qpR6oU4PI2xRwvkxHYV0H+33PJjhEy9p0rsidmPIQSFaCpPG3qaHCucwH0tdWLdshT6qQ45
 3csoPH2ue/Dz08H0ZaWtgGokZXu9wdyuKc9NAH8QVvjExuFHByxI/Zx62DqjPewbs9QFPwdTOh/
 kC7iSx135SuiP1qCBtfhoQDesJWIhFDtqU6bGYLuqt/1mE212BKghXwJB8+AEgphgJP4EJwJ2Aq
 BPCa98QWI+3OTEnpiUaFcHhrkREe4mEjFx7oVgBXQgmc8xS30I+pvGT2HkuSK+GKegIU2S1Zxwo
 CMASyqxNlc8B8Dv3NwjyabHkjFQ863i7ulmJbZAc9PAD70R5wED8yPAv0Ltdrc2gtTlMZ3/O1CK
 CAGmmT/MI3F1ytfSPGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX+lKVpnZ98nW5
 cbsFWGiMUuWPIuymPa7M3JwpiGOhEtNHdLe0RJV0AHOuGXr55zlemsy2u+HF4wg/QIjxXuqGQ5i
 n/9RO57/R5WYJ1i2rbmxMB9lbrEwR7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..b09a70b3d576 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,7 +37,9 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
+        - qcom,ipq9574-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem
         - qcom,milos-imem

-- 
2.34.1

