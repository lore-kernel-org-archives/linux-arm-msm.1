Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007688;
	b=Bv6QxRrTmi3eFMriNegfibjFmnEtbRu1lZaRZu4W9Jn3Ii4pRsuEWwcmFnw+5SJ1pNat
	 liFZCQ37OQqF6EVVhW9h2XID3X7y08YPeDDAoODncAxSikWufuGnsdppzrqr7pOlYfNLy
	 BJdcPJ8lZEqcDYkZ6ZBx3j8IBxi7jT/Gi1wLqeXxeTwmJB8mbNRsdP8d/pZrXyiO7bS1K
	 d2k0nwMnNebOjkhahOD1y9+9+E8/4upgKHgTj5WlzGLCKJgF0ph4PAdp6t4/62OqK4zTe
	 L04eKw4tTnRr/F0d9O9KHtkIkkN3CsVR43lu14kONGfeGK4cwUx91nJv3aOS/RLv5lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
	b=dfZj85CU8s1E5b2n8Feg50x4igIur9nRESvGfLr4YeRaI6JXYT1BLqqhnMboq8wNGuZN
	 fp6QvqbSnqJ9QaBItAx+QUqqqeIw/UzIlZDBR48KKNm4TBUAfmCmXkyYz6MlDR3pPTIlH
	 OcCOvzHIivFBAee8fwE7THhfPX0OW1yFizpcw0/7V0qc+iZmVQ9kgsHNCm3J+WWz34qKP
	 q064rCPURiZW9Ngd1KkiovmVVuQIGFbd+QIdGYFwENP7q6l+QcIujMSWCZCXTLN5VF53p
	 IMdsgz06SqUzrynBbJtvk/eHKZ3TcbbT5dmzoQrFl70+yTp3R1xF02Rc7q0uxCj7Xtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLKlw5fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9dO2XQi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496F606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6496F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLKlw5fi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9dO2XQi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4ahSW1708828
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273Pk
	qknjpX/0=; b=TLKlw5fiVJflwNmMuvHHaDIZeW8FtofXsBWrpqFH9qwQUABl0Gh
	AU8r42ModYcPvZ1Buvvv1tM8hkcU/TZUudtyN/z4janCRPTeDx3jZWmRMxeivMEl
	BE+uXHghim1wLP6HMr3JHZExVCJ5XnNnAlf9pD1qnEDXNyaW+q0NSsMVxvM0S8RI
	yWtqwsSd3Yd75Tf34xG4eqEsZX80uZkQhe1YC9MdQ3hdyoj0fVth3MvB11Q5hKkw
	S4mHKV8sJVEepA3ldZKeg7bC3gU2P1oNJIWYboCOtE4YEKDIgMSKcAuJzH6cvjUW
	gKydjrlhBA9OBytHAt6Qx0F2eP0irtJaYfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9tcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2500389a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007687; x=1793612487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
        b=R9dO2XQiy+A147qxfdDJiFwy0AG3bkz7yuv8uFlh4peSEShvbsb17UQiSqgylBzDSQ
         +etVjpnfuV9YLO4i7JubQtgg6mJm5i5MBvflXt1/3maiNYkVnYn7e+gUzoKccgNRb8Xq
         4qiK/EcYskwQs5WQ3aXRMeAbwVCRHtyBF8B4NxppcqPnBi8my7kmdPdaagGeo8FqXEY3
         XwziaRlFSRTa91h0eEpIzVVP7KK6mBBUvHa6kt5XqTwe3FoxCoGQSCisUkOouCmSc0Jh
         xqPHsexK1qutxlX29Dx3yr3VwdtR7rP53cEyjT7q1Mmd0HKDJ7ghfcUfKkcT1Dw92Nh3
         NURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007687; x=1793612487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
        b=iHeWubEPUDQ7sJM4bqYsQozJsvO4kYhM9ICxAUesc6iGpkrkv6GK26wFNUqoKvvblq
         qUW+2wPQHg1+lApSHaoBdki2z/bzyWy/ueZTBKT9CjVZGIxtA5nm2ubuVjsj/VG6ucwQ
         +tEM6AhOCnALEKHa9E7VFbvecMKGE//i23/GEdn/JynYX8SmJXuxHmXML98m4E7QOpp2
         No55qomWdfHRvpNvnRpwvL8T7CUqG4T69yt2xAEPqnoCZhbaVnZhcazsvOw2JDrkbN/v
         DIZm0VrQpz/u70CeDQhi8bt9eX8iSdewOAPQKuqhxnQTYYiu0DqdU//sxVO9WHzur3Wq
         lO4Q==
X-Gm-Message-State: AFq9FYLbFSPEN2DgFdgNU6QvlXpzBJfvqVfeqPM3Hf3QQfXi2pLeQ03V
	U9hAJLCAR4TS8qPlO/3x3oY4OoJI7Tk1ILSqc9b1vzfbXkV+JoYc+jm9hP5mT6BTcbOmoMiO+ZV
	FRgQYKJZ+rNeHtFOp4H6Lb7Msk/z7ThrnRuUqaAgCK9q3wQeFhJP4BmGhmFqE4qw5+hwC
X-Gm-Gg: AYBFou2Toj97kE4heN2nIqZg1lrSLmyCtItegiFu6RvMiD3jIiVuZFwEShRISTxM8wF
	wb7Nyrn9WQjMYOR3LhPNVmM6BUv/AC5HCpgiXQXrVBFjiTKLF0GRHEM9rREPg93k0N5pzU/7KP9
	e970DxfEE1uE4T4XHsnj3MF5sSbV5EIlBUodJtEohVNdMl5MJj39zeTKpj+vK4Blu4MocQsCfq8
	KaScOMHRrovIS+N9YhHA82/Q9cYIrJMFIxsBMQt527HFgebpNTOb7j6rtm/NjXves0ZaelGiD/r
	V82QQJhZKNtJzn0I3K1f4T/+QhclroFrjb0n/p7oVUjxJgLhDqpiNhplh60TAilq71ta6rXD1PA
	ZinfCtZkrznoXdXqu6FdCLKlrmMI=
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4669285a91.34.1793007686662;
        Mon, 26 Oct 2026 02:41:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4669278a91.34.1793007686213;
        Mon, 26 Oct 2026 02:41:26 -0700 (PDT)
Received: from hu-vhiren-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7847966a91.12.2026.10.26.02.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:41:25 -0700 (PDT)
From: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hiren Gohel <vhiren@qti.qualcomm.com>
Subject: [PATCH 0/2] Add support for SA8797P in the phy-snps-eusb2 phy driver
Date: Mon, 26 Oct 2026 15:11:16 +0530
Message-Id: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: pnTwcbU6FcKU0Nf0xriPnAyCIQTjEN7E
X-Proofpoint-GUID: pnTwcbU6FcKU0Nf0xriPnAyCIQTjEN7E
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf2047 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Mr6FGUSrUdoPtvCTGQUA:9 a=ZXulRonScM0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX7rkC5JNiVGjD
 KTVMPewU2mJwdNQ6btvhTtIxta11DJC8cr1BskHLYq4DNHlViSkcpVgwrtm4E5FlKxMV/uMVvlq
 L2cS9Zl2tQLDPEuDjLJT6JnFwCL9GTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXyoM+PgeHbs9g
 cwb/0trCkVUplMyJK0LE9jGW3IYtXEnQKv9qkkxhrdc/QrYjsa+HmGn/kkpDhLnjwNYhAZHmhTi
 Gks7Dr5CnpJ1zarNf9w19pGT/zgKVN89+vZmlh3lLT/zNkGY1ZBEze8zjCwSR76/8ilMjTysSIT
 q9bJKA4jQVvlMCKAq3xMbQIP4B5gl4qfG04TB7MkXvRFTPFCGvhcRGioklLyinsgQAFLifhxVN4
 uwQhw7QiTd5dtO/jkKDJpt1RS0GR6ErcNZGj6aSq8/Ynz9hYDPqGmwc25t8hnzicNLf3x7cI1Cu
 kaKs4eZL1vdm5NE5kxtpLSDz6MfD9AB/nDP9h5rlqT15S2F5wdghEZJCoNFoJoSkDSQ1WAuQjCo
 ZEeYf9D0Hu7WOOfibGlaZYVycIVQqsNNl/d16VyiyiW9b9Zw5QCfRnyj/+pOGQUjZtxbWpD7tjM
 QRvW9hV17cT56QaqAWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

From: Hiren Gohel <vhiren@qti.qualcomm.com>

The Qualcomm automotive SA8797p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

Hiren Gohel (2):
  dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
  phy: snps-eusb2: Add support for SA8797P

 .../phy/qcom,sa8797p-snps-eusb2-phy.yaml      |  68 +++++++
 drivers/phy/phy-snps-eusb2.c                  | 183 ++++++++++++++----
 2 files changed, 208 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml

-- 
2.34.1

