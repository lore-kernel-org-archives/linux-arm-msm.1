Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200857;
	b=F2sKwZ9J1R2uccZrqsLvORjDGIsFOBhM61vttFj1Er7VLWXdlY66TrX9JuRXUmzsYyPe
	 GwmSyucc1xZrVJzqvd25SK8OMrjKK65g1uEmG+EsY6Fh1D7TB/O+1uOqNgSciNQ33SrEZ
	 Dqj4Fhh38BSBDYdEFSRINjYRo4CTsdbxzjEs2XyuBCgLiHK90cVc/WBGl2dKUyjL62hV6
	 LXvDbJKFBuDIRDhQbpskYFOUbX+pc69m+Zt+joYlaEc9xnANUoe59dOpBOYrtR5aoSbed
	 pCPHt3lBzRVi1zPclRhT+CAMfiTALC4KPKTdzja/E+lKiQDB6TCiEj36/MP4uot6KGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=wE0/8urj3qytcdOPDUR8ynzCb3m4Ki7Us5SbNq+aQSfzATa89tFzxorg/GUXArqwbIOH
	 Q06rbZmbKLDFj5+UiNVIRVZZTPf1h5AS5bEYVxJDrfRSY6/scjrM+WPLJYTaGZAJ9ww5R
	 3I7wgixApjonKX4kdxuAYi8eN8+fiy+x388ekcAejydsOUEA73JsPArFDCKuWFz/somCH
	 e3oCxWDQ8Ucd13IGEbK28aYEOV13iZEBWISZyiohkW9FVdfmCe5ligEqihsiViWL1qcMv
	 c5WzCoBPo9vDMI+QXbW/CbLnZ3X0AmL6U+1VJ+maXZZu4iLwh2m5t93gn4SGxOmJpFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AeiV1dUn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA6606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AA6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AeiV1dUn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAPGC2544064
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=gaYc9k84PoLq9363
	VhsGb/OPFThRaWzzY3kdP5OVzSpQVOIm3Ang8GUVi7BBUZkHH7CUcYo01bbHs+Kc
	9KIftVFeIzwZNmVwgwXH8GXisyp+A6+9lWH80kMHHngwTD9wkt0k7YoZtRiNJiy4
	X+v9e0uyepI8RVdOQhbgeTVocIlR0Ya6iL9xvgNNsxrE6JT7x2gdpcDRELPlQIkU
	Vw/C6P54c3xea0+HhykvhPE8xBblIKDMkhiEpclRAcjFQOfWYbrZeOeDAdJ4nGYI
	6xllza0er8CNLBkq+mYdzGusuzuyz6GhcHhsddki5byGcbab4lZnecGxu7Ermz+P
	fBvaaA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr1vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a3664e1fso1807352d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200855; x=1793805655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=AeiV1dUnBXPtFWEC5XNs0R2uPGKW0vwqltsuyowKj5oluDv/rgTrtHOhDbqBgVeTZX
         NnRHZLInSDyJreKu9Brgb6ecG/1lG1TluVISqjrT+OqWX29VEAVKXLXwHG1cfH96s3O9
         B99eS0lyKHyPEveW8tLadcz0221V2sHi493c2xpVBRffR5i29qUs2jeL9wT87UAWAMMp
         FbOVtBG4AjFyZHM2pldNjiRHjg0RJMJPS53fwA+odgFvRdbz1jZd1PSAbeNBb3+xSBRj
         HdO+yfaAiY1VEbTrHM2uHXVJJUrccdp5+LTHV5sLw47yooABC3r9AdUeAyrLV2DhiBlL
         DFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200855; x=1793805655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=YAl65+nWhGlOtDJfYHx6WK5Y18nQukhI3I/ufLFErJhatuWgox5xCXqOoFbKLZtnCC
         DhmuJpszDUcexqaxonOcCrU5BjOmcuplSmNwjDizTjMkVhGEPZ2J0uWEbL/KcC+/W54n
         To5e93SbVCTTyPpF0AHm1yb1bNNLhNXLNt3nrslyWBRlobNsqsE5FoK9acXbL5nDCNVv
         axQmLls6fI/E8hXxPxbqxPXgJ3MveA5RgP3aTuyedE0ad3rwMASH/iR39rPFETcNoLU9
         6XybhZTAqKc4XilEqx1tR2x3o0R0+Qqo/yelRamdmyQpzhbjFbWrfZORROgC/J6EkVC3
         TIpg==
X-Forwarded-Encrypted: i=1; AKwUvBy7pZ4v8n3QONUzw0xRJdhqGzU0QzXnwvFL/yuAaiA+fTZoXfYow8OzZHaoQ+bC1PRQ6w6hTQ3pMaRoR3Tk@vger.kernel.org
X-Gm-Message-State: AFq9FYK64jFFdu1iMUdd1k5ki01K2LThDeC65uYs+e0S6Tdu+whDeex6
	4WeFSyNApe4CEFMr7gby4xTaEQAW0Dj+IFwm2MTL/GbWiRVGyjMmgSMUPMvtXTfwBThCVkA8+qJ
	ekgjPMOpZ1OGa96SVAOxBt1LWXxMzV2NovuNkjp1XXYGKN6ifXCAuvGddIqsf3CPNcBp7
X-Gm-Gg: AYBFou24aL1b+QfnBj6PfFNGOhJCwEywWdFSwzsnVfLNKmUxwwye2/KkoyvlOlZQIP8
	hrrdUosDu6YH10QzwWbTBk8AveGvdnADTsSbYHY4vPGzwhvN5kbdRWmIvdt7xW0IGz+HZVk03wJ
	S9yT4lXNcImN8nPNHOjF+wLQOm80ajITtQ1TUXy44vOKtJGN6ebEdWFYInB73gohNVo8bpCazjp
	Tkj0vAl6Vma9VECC32x4CkPS+sTU6Ev5o1Uo/+yeFFstRAu+Ci3EuyjQpOQ44ohKtm8q0y+5kE3
	jUn8AIoswMe5eY/1WgT6VUwHsYFDheBO95DzjPbvh2zg1oMYX3xSJLouBXH20yGb3TbGinu6gN3
	GnN9opQMsD/Ksd2oIX3ttpJpZawWUhIvS6jmksRcftDVRZ0RW5qcFLS7FOnVbDg3pK1hUA5ETRr
	w1Y72YvAe6SLuY/wIiiQpX9iNOUZKnUlRr4ccF+SKsVdmrowAuTF4mCHa9nXrS
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474816d50.39.1793200855500;
        Wed, 28 Oct 2026 08:20:55 -0700 (PDT)
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474784d50.39.1793200854685;
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:35 -0700
Subject: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: WPmkE6vUdjnkRtGSzpXqJBrsQ5r1wdUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1FRyaSVcPWHn
 E+GLqV3TI41Yv5ZV47e/hGMtanKnOlnQIKDAC6OUjLf2yzg26M6D3iFDOq/RVT1dGwf2SnI4Ie0
 vrmztKyY6IV00twiRHADx1zve2G/94FtWItJ7N79DnVUXb9YgLD5L0LGQp4Y9NrzqwnzFWhsKJL
 sfDU0dvFsEbkBp97e0ObzxjlWtGCX0zs5D472fT1u3A4awP3j67czIVhl7U+t/joSPqRa6WU8qT
 txssoA4hkKv6lY63aYNpDEkycEwd7VdXlat/thfTUYzzQ8i0x7PZ8mvXi3LxU8dZZQRUmoeqpHu
 FJP/VrR98AxTQ7RLzOwyAhRm/PtuBS6tfrH9543Da9LiHl4bqRrnnn16IbMctIC9pbOgwEf5XHM
 eGlnW6G+D9GdDPUDjzSh7ukGspVt9Guk5cx3OHVgUXSDp6wD38cwYX/QeRCoGR4YsTchXkcMzQo
 2CxorsirSix6qfuTeJA==
X-Proofpoint-GUID: WPmkE6vUdjnkRtGSzpXqJBrsQ5r1wdUg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9Z+fohXfvOD7
 2PtvdTqn3SDwnqjDg4vkdTtr2ABVtt10+eiyXA/+77/2sojM8urL08Yp5tKRm8JmNy0IzqE7Dgb
 sfWp2KvSNBjEmYNBDOU2J9FmI1+sWHg=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae212d8 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

