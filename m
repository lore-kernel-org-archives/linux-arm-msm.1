Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574779;
	b=iVHKZjaDedVjVfc7hDWHI9CUFuwgo/jI01mlaR5BF/h1lBF0Z2m5AQRYOrJAjDRLX1Qs
	 GWP2DndHTPeSOwbMHtRRpTyM2xLO9soXZLH9CZiT216jfwpGOPOh0GNOoH8AFqkQJ5br7
	 DFTb2uxS7vOoWTesUdyJAIT8K1yjH+Q97eyk675S19sB+t6/nHtLfq9rhS+mf+U6ws7AP
	 qxBI0ggDwCfgqGuWyqBy/UrZB7Of7HPmEpmdjxPYZcHqeBN3UdCACtzkHMqTSmaLRZ2++
	 2c5ixSHqQemeMRjXqEulgvqYZAaG8obLuEk7ebVUYh+0k5gyN6hSIHjWlgD/lOb8EdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
	b=Ndw3VM6FmjUdB9Z11uzdaR+b2lRk57+HD7pmBeHi5+5BMFmnOxSRFeYa5LIaOsEHxO7m
	 KbbhKUr1XQFALQx4Nvr3FDoxPG5+leVAebrYHkY3b6x7eUIz9VipTRzCJe7eAipnK/Mjx
	 1RGutnjGOGf/1//ih0fBY/VSagR01swSkHV0gYn8DTEtbk0YVUCLlKgd36HxYaHp1FPhZ
	 /yyL0lsjHR0sgNymgl/rSxXMLYgiIUHH3MQtgrGWmQSbDPWR8zA1oP42bTCHpSbK3dHLu
	 cMwuO5fZvpz0RAXBlQuO+UuhW+JOJne3CHtmV9pJB2TS/JtXOpHztZqCQLv3wfJ/c4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=plflsPsJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXLV+xap;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25C606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D25C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=plflsPsJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXLV+xap
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j089756335
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=; b=plflsPsJl/slmmFd
	8laA/Z9kJZCWStJMxXQOkcWyDay+oJ2fEmOmVFeKTM4jYKgyhr3OrHifdPCQYz8l
	mpXyze+EiZJb6FHt78FWA+PuJy0BCL+4klqDsWFo2hKVNTUSs2gNS/pg+VEjqlLb
	WhyqkgAUms2zus4Z4QV2LDQU/PxgPO9dofMjBkbpmCRqDFV978rX03HjsyE8LwB+
	q3U/wtYQtwu1/bI0KkUirRdiaX+3Den2B2EG/NT5iCvdGMqG9vhHvFQE5hMIcEr4
	bWJg2YBpg+RhOUsh2TCM0vcOjOaTjJQrUfPFnRm6yBqvwA9Tq4/eOQoEzjv095ea
	xP7I9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4u7dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:26:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so939857eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574778; x=1793179578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=IXLV+xapULjOV7O7OBpSyhgEPGcmUefGdtFWO9l1jf8zKUzEBCJnnONFhj7L2oDnPM
         casK/2tSzzjYc7G/DfOEk8K2qWfplmoWOO9zGEQFKBNi1nHojvpkQk6JvMCek8yVCB/r
         dq/bwZ6XRbu8QqgOETs79IyKMvZt3gioBUMXSHfdExzs0GBY72ul8Qc6tpdoMhhdIsX3
         ck23GXBBbdbstaPo8BJS58Hnp2CimmG3IAHWZYS9l2euAT4xqqk4Nzv64+DXOleAWxQ0
         +zUBDjb4KB77z2oTlQWxQQFAeoFmY/hLWhHy16Nu96rgkccB4G2QgNgVU7p0d1pao7zD
         WlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574778; x=1793179578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=u5DfjuFhomo3fftZOFEaQ5ttpXLxdnuLVO+iwWwL2I7Un5aOzFk7qWJzJorKCVpTVU
         YSilcfSmj1udG8XOf3sFZbWIBs5zPk0CbZ0Tqxs4Egu9G5SdG6zLZb55eqZxfmZHvpoM
         wUis1q4bPtu3Eo4rDVsxMi3PGHdVHvAv/JkuaTMYP3VDSCUsHQ8fOnJsiudKEqI1oPgH
         ZRfSYz2DqpjmQgpBD/4v7sPKY70OOGB2r2H06sLIEpVS4e3Abzss3z5Dipo1MhRMQc6H
         NNEAfcs/X1HVhBkRboSk3u+xX7r78/KuJYVD+qaDCdYYU9R6Tq2sowL9U3hc1HCPdPcl
         updg==
X-Gm-Message-State: AFq9FYIzbl02O8u26q7q+qyknP2pCctojJMf++N4iky7Y5JemwOlaF/I
	AREMXMKNVxfNiKazKITXajc6fFUClP27OpXRLdIC52Uf+3lDdbSiCfKo1uZh+7zdbAEv3/4KRv9
	RC1jCn86VIvKSsQmQxO+2NbExLexp+R0DIHIBdjY8JXfTFFZtwlZxIOdtCOnCgtfx2laz
X-Gm-Gg: AYBFou1NTJGOj7SuacgbXfnHZGSpvwBHgViW4FQTyTr6xNv3fheUq9K9QQRV/Q9tVQ7
	bwov7w9XU+UjjEW13I1Bj9clg8uKUx8XqEwFsjwHZ8eoOMoBzFUfSBDQ+2nU/ZrU6jow4w8AhPg
	u1Rr3Y8tTa/1qiIPj9zArmVO7k85lP/pxc+/K4f8QK5S5/UO/sOKX7neZeBWrJc5fzIIkfA9eSc
	0vw4ToiVhcahp6lCAXLxxmvfIsNYvUt9cQoufBPecxWUlOaZgXEk9M/wXaCpgxxslFbOsPveTvk
	nquZJD1eKy+Jqq63wrWyA9bAjhNuo7lB7s0sqXRzqhJydfegcLZyDBKy0MFUoFzjkOkZ2J1nssm
	OQy7GqSyQ9Oo7JTYueshqw5MF3LPtuz+B
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2657637eec.35.1792574777871;
        Wed, 21 Oct 2026 02:26:17 -0700 (PDT)
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2657610eec.35.1792574777323;
        Wed, 21 Oct 2026 02:26:17 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:16 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:49 +0530
Subject: [PATCH v6 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
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
Message-Id: <20261021-dup-sessions-v6-3-578ab52ba66c@oss.qualcomm.com>
References: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
In-Reply-To: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=1219;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=VMGzKTCz/azLzKyF9qh0sYFoOD2oiutFm8UHF1H6/Mk=;
 b=RHAEq1iBAsEUcfhN5ifaU3s8lvFXOfr2CVxuqoWhnvopFuaiUrJQ7klbFFiD8K7RDMfsHBm+u
 5aoeemGEKNdCeJWePMuVPimsjC5W+qMQiJMLN4JEAGi8CTSjmPNb7oN
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: DvWvqtSx0TLAa6Z_p4gUkxxAqMfOT5Xa
X-Proofpoint-GUID: DvWvqtSx0TLAa6Z_p4gUkxxAqMfOT5Xa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9qoliBBQmjQl
 /85lLkoiNRs3QJnqRjhWYIYUnlTfEKJph7lwmevJo42O+Ntp25BfquKIOtlwgylbJj+2Vev7yuF
 6RQejPL7rEEEoLTmNTsD4sN4DC9BIl4=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8853a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXy6UuL5rJc0yu
 MQMdwuyk8ES9YPq+degabWiLNHTEHdCmvfUn+rW4LTd4kSEA+1JTDoxszC1QY7Rp33MkVxmKIdl
 IV4d7+6qTrWsXIUXKqKm9SbD5dPzjxDRm05Rptzek/iXhS6T1kBcQyVzL5WDkisGaagAPsc18Qz
 4u2NVdKnJZ7GG54YeqH9WgisAgy/kgJJJLCxUG73bJEO2DXabxxNuFt3+4oIcuEvwYeOAsr2DRT
 ZynczkFoECq6M4E2IPqSuQmntm2RIbJnOLFtMPvGpTPG5FKAq7JX9ylQMALb5j00ZzTpwUxGQ0u
 0ADqG/DsitFJtwusJm8CTg1NRhXFiv5pdzIUTyGKKiXWp2IWK4zhFJfCPHh29RHPkA53uiua0pR
 +CX3sch2/Syvq5gPI96dUn4PwH+M4eJQAhfn9z1cNRc3HVXeHN6BiWPqn5KLGn/snH9mkIiKoVd
 hGe6Z0L8benP647/0Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

