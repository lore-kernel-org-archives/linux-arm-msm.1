Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517632;
	b=MbsrtwL5I/A6iK7SEckG8bQNHO7wjxBbiOgHLc3phAM5JLMvOvdDBtpJV7Y4+jtkI5MF
	 GRd+WLuh1YQzKDtzB8q1A/EkCqV5oEz7QKo8kziXWY8H3nq90Y2PAHvyJtQxSyNEia+rV
	 WroGUNiml+QpR6PxzTM05R10z9MURLGylw+sX1bdBUWyQqsTy56//ATphiMtwvhyWFqKW
	 oqI989mAh6K6v2tWfpAE/08sD4zhJSBtw2lUonRLc0RXupx7C0YvF4uNJUXQGoEPJhykA
	 1XGbVSBgZA0/6cVdP03FzblTod1MO7AFK+MUdZROo0SLu+/9Sa0UierXlwwzSNSj/bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
	b=WRVp3oCJdgMEe/HXkYl6QkncRAIVS4b21PPq8LM+Lg1XIbDGIObN/57B5kVweBx/VH6u
	 Y+7FhAp4t9HePtyEH/EWKes9tk4I/C4+qAVSQO9ewdcx9FS6UkihGs6uXsw3dGEdQ49P9
	 ObKO4/5a6JKHc1VGgayILyEbu/xRBYJUDZs50YOUNWnRYGQHlb5HekfoQiKwy5lDX7Bev
	 75995uDNe5szjQl5CpU/C3853VmVhljJpoBZIRLlqam3iggipCE5+himwViPwZzTQULfv
	 K85CduSoiq+cAhPzJ/eLG3501hg7zYLjQICkIfXXDdkvT+bZMoUQzsERbgVW4b+oA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D8mEi16O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b/1Oxouf";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B003606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B003606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D8mEi16O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b/1Oxouf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAPGbl4136029
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61
	eSr7kRh4=; b=D8mEi16OhT1h9GVI9NJ/ER+82d6UcxApLEMRZ24FmkqgGIGpktZ
	dhso8bPlYZ1orj79vUVVYQfZO6lF3FuPVfTW5nfSJE1sapBkUYgMqCAwCyIonQOt
	2aNMteg6WueYDNEE4M7t+WNSwBX8B8r8Dim6vyDW8t0OQgHoem31nH0nSxwOBGvS
	/P5G+yRSbN/g9/MHIm7zu4F8r3jvqpDQlGINv9vCIwoBGpXncclyYuXK/JFRTYQT
	uz4W8vLOoYOjnfBNlXGw+mComUeucBTwZMp1xGy8ymzbu5Gnehc3K1lP6Yq/wPKC
	jWMkqJ/CdveuYvoLzT8fg+xMe34qZoc9EyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rph9sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso5018241eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517630; x=1796122430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
        b=b/1OxoufCS8VBmvOSexD6teNvc5t5Vt3xW9oUeh8r0ARbrUA22zSYmrq3gKaS3RW2s
         qL5bfc5M47yQqch/UL58IpGr5hjHDcZb5bBIArKaK3MHWuIYR+6tcp0VPy5ofhnQsKD/
         Oe0f2GgKB0GU+axTbpvA+GyJz7FabOjlIyvJbVVG2nvqcauHJVEcVauAuAAcM4jnPiDq
         bwNI5/ssuZs9gSZD/4ko9hNvayq3+iNXp0b4wPGHoQrIZXTSkse/Ba3tlCyp4gklcLR9
         JuRdBQJ/DnvoNtkRA8xzplKAbjEQ4ZMLUbVm557whsqYvRIr20hOqIthflSuCuyGNMtC
         z+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517630; x=1796122430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
        b=Z/XAP7ve/pKUm9sEDKiDhq17xzZKU5OtUClqfhV0+zGnciFz/SktYRAePz2FvNswg1
         ePdo5m6ogPDPELyQcjHVYmCMpPpSElx5azCWu8sQQNkdtY1g/nbobTDSU+E2CPQ4b0YC
         Ybi429sxNBXEP+T2XyjuEsnhfeoGgawyp7dkS6gd7ubF/ECJISWicbj+N8pkTHJ96vGd
         VfkM6nvsB+t1/oflgI6AtAVMgo7t0JbQ1AxdHo0dmPasLTvyUTC8Lf8JAQle+9YnIHH+
         mrmDSvuZ2PZJLpKXQMfHGbnjl5o60VeZbL8ysK7XpEEall7MMflKjAKVwmuwis+zq0mS
         ViBw==
X-Gm-Message-State: APuU4Z9VK2XWu/TV9ibbr/2bB67YoE6hUXlDDPT5fA0wnlaR0tyEV13p
	XwTceZm4T/b8jOq+xYCgDvHOdWTtD4zfkiis77JgBybXnnM0fLSILShhL2WyYKvkEwOwsTS6xcb
	msDp8xwMPuxva08ghSX9EXGqP5FxnoaRHyI1/6DM3QmR/agjbccVZykjpxjdNVA6Hz0el
X-Gm-Gg: AZFdTZfCMwOt36kzTH8Zk3arM+B/pFDkhg7LzPM19UWowNJP6Ra/0aGneQXIgN55GoN
	OYLzbeIWh4N4zWbzPxA4r80Qi7oAoHUz7mC0+d1VYMmv8h1fDxrWKgKIQqg0R5ap/ZvFfmRr9X4
	Cv7hga7D3L3dFfLrKyXpVDkfXS63uO9oIz2nfoPV+oYdnrn0Rs7uGEBKadwvkfJHaPdl7bJPt9D
	eL3oZXiDbw6hsCWWX0Ns/3jTaEHI3pEo9aRp/ywOsXjh9Zb8ukNPJV0fuwIGnnr+1VpaAFA2Kan
	wIjKTe3ziTCf1JJTDKDbKI0rZnoe9lkbDemmKGreavxDg+jT54YDOd319YVvINVy90//OFviPzs
	jrEYEOXmCoK9GQy8Hf9TbwxNc6TXYythlNIAeOoTR+3uj+NH9HOhJzbZx80cegQv+ehKt65gz0x
	dW9sLqZFz6Nm3V+SjjykMcTFhbT6hczzsEnwZBeaDqQftE7ufn4utS9Aw=
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr15017993eec.36.1795517630093;
        Tue, 24 Nov 2026 02:53:50 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr15017970eec.36.1795517629438;
        Tue, 24 Nov 2026 02:53:49 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46282021eec.6.2026.11.24.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:49 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add Seca CPUCP mailbox compatible
Date: Tue, 24 Nov 2026 16:23:37 +0530
Message-ID: <5bfd311f596ea5945b7c2251199d2d0ccff41133.1795517617.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXz9XPDKCAzYVP
 QJ9fgFIcLrVE1zPmCailUqgczF5es4kgtX+zEJtlwdQ0CJOdthOssfZe+sCx7ZK//aI/yGgSFTC
 udXTVi39mDi//SkNR3kysz/RUb62C8SlW7xvQlpqpPioesGrMqXXgkgoc8f628Lp2FL9n6DLGWL
 Zkf3nuDZlSoUPPGnNpcDob507WpSwuwuQHGev6AwCehbusZC/x19Fv1OnsqIH1asb1IroFLTZPU
 531aGuhMJGkbtllP+GledLno+Q+ptjNljTTxj9xX7npq6YIe5QkvC3CEJaRQu4ruK5KVqdOJ3Uz
 imtprRqyHjV74jPfsQ0B5rXPmS6x/bC4dTTUmQnh2jQFz/8aoHXvjkQvqFT72AEX6uRF9+ruDEC
 xnGeEM8WvWc5tGUzmHN8Sc71jv4YIwC8tRBljzgwzqHmKduJZLANORvg9+j5CnHcDJXhAS4dAbJ
 kcdVQysFGZ81HI39mgw==
X-Proofpoint-GUID: VuvBPC5aGsMHwfwHL4nm2U6S3cRuR_JB
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056cbf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+/ak1afBA8WY
 5GLePXcq8gw+lXFCXbUfTtrzzeYsfPo8SAliKwbrfIrj91y3rGien+JTLbkLIUHTAjwQoqCNe22
 Fs5/zAbSYEWkCHCLib3O2Qokq3gMLN4=
X-Proofpoint-ORIG-GUID: VuvBPC5aGsMHwfwHL4nm2U6S3cRuR_JB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-cpucp-mbox compatible for the CPUSS Control Processor
(CPUCP) mailbox on the Qualcomm Seca SoC. The Seca CPUCP mailbox is
programming compatible with the Nord one, including its channel count,
so describe it with qcom,nord-cpucp-mbox as its fallback.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 2185920e1b5d..4e0527203e5b 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -16,6 +16,9 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: qcom,seca-cpucp-mbox
+          - const: qcom,nord-cpucp-mbox
       - items:
           - enum:
               - qcom,glymur-cpucp-mbox

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

