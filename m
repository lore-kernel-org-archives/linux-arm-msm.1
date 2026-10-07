Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4913FE348
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354614; cv=none; b=ErBP+4nK99U/kCm3QCYjvOsO6+h5uPOgu9XPz5ftCQ7jYa1mPbid1Y4VRV9JKC7rIj3md4RqL2ecrswTRLK3mzlVQhfZIEb6HrF8mj422J0qxy9dmW/REpQ+t89Uq52mYFFJHbonasGDOr9RCnewtb8Gn2VcZz1hcJCFiFI+EKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354614; c=relaxed/simple;
	bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nsouh4O34UOa2YgY8rJy/1BReTJ8DDfOKQlTKO49WqsY1wGRdhlgbCBtHDzp9xXdYsIXKLsJZcn/2c5CO+0ZQipWz+6V3qC0RolnmmwLw9qTPwDzaU0/yvIpuyVLiZByZuXnfEFkOFaKOU5c1M5Qi9UGypJh+74rw+enKUfnhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIet/CON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/lTjfTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIet/CON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/lTjfTB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UMwn2774365
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 06:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=; b=TIet/CONig7AtF/B
	2v7PGAl0tECSvmiuV/+ovSoz3rdEARorNEBFitEDjTckJzpIl3dvDw7V+De3Tgzc
	4BRqFxvEQvh01VuzIElGWfpqeij4KyYIjLo3VOh9d0IrHrrymYj6hNyzzz0HyeCD
	SrJEXyCyTC/CA4tKv8v+hLyCUiXG/XsHeAXHzVk5t9F0zX7O1PwtBtlTKTylAU3E
	ki9u270KwHPHffXGpjY6Ka4/wJwgU4U5On0nbUT3cYFwML7OHto0dBXDkfC/Oka0
	S9ygVopEYPn5NZZbJwhKAJDY0O+FIRaHtrIM3BKVayikQz3sfm8/Z/CUjTnVLbxB
	A1FjIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uk14t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:30:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3931681a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354611; x=1791959411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=F/lTjfTBP0N9OmsN6UrYQXbIyFV9ZRaCwekdto88/WUxpxuzrbIwLGeK6QcfF55FGv
         KWUHkUUNY44YQT59EfSdP5zg38ExjmSdtO1g000ciIH1d1tctbMCmTi1s2Pwg2TIzO0w
         4Bbl1PS7VqxoWieq3+MdaXNynzOi4dJuGALf9ZLSRUzNqwHcz2R5FBLMFpere+olbx4Y
         qoVBlYGrNJ9UvurGflH4iEzD4xoXaDYjk4FUYnv7HZwGA4WF4TeMwi/KC3OwP5lPghPL
         qQ67KBLTW70ldKonpRnJEo+iKjEa2zHkc12KbV8QCw4P+Li+7iqK5p3vknIjlKYZCT5X
         A8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354611; x=1791959411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=eIV3mtWW5spkNFmiQ5oCAvhc3yxUCyup5dvcoNVSiZyqWlQMIaL2dzGWggDfuQeFPF
         jKeP7patgcjv1f0dCvNQHCVhugciYCf26riZhZ3OCkkustvapJTRupx4ommSlGbJ/x4S
         Av21t4luBkdlK2cfPcuVgDKqpC4oj+p0Yt0vWgmlnOqW2fy879k3r+CIDpPwvw0Q7f1W
         fi+Q+aH2IPu7Zgl9ug8DqsROWrItze1tsIR0UYfENnpMDLz0da28rH5leccZu66uVNYA
         yVWKbcyFv87HWqgh+EuCnemNKiQMv+6ov9neryT4fQ9IrVCwE7jV5Ea6bqBFvLOfHSHB
         0NUA==
X-Gm-Message-State: AFq9FYJjtdTF0rGTwTXEQfr0GDt208DtpsmRpEUVKB6iMXGheUj0kx2i
	o9MDqkik9QvvUSh9BRH9dikkyL23a+giejCDqVcWV27q9qfhPpVwWFoaBmkftffvFLuRsycsgHR
	Q4Y9Ere9A0fe3t8Me8/twR4c7lpQ4kIw4r3NUdj5L/WPm6hQdBPxXA1Xnpxotqh5LK+2d
X-Gm-Gg: AYBFou09eTZha+W1AqVLOoU/W2nQDufEJa85tNANmx07MnBzZEZAKQePXbBOP0b3o1G
	K0caHawx4ckEasiHnMe8IO7VtOSqSmdMy6SH/EFbf/wTmKwvSx6LMszoYikqTmrhhSSYwwUgSpr
	cGSKHlE58FbSOEScFH0/5i5Inc2qWqXSk3tWeIz58xD7qGQbX3iIaEwBi8WF/1Tku/6zufCYHJA
	BWJDFUJR95xo8IOrIP17FvBjuXqsB+a4/bKIE7VmQ6OS9ntzBgcshquH2dfNfk5nnpcuQA+Nj1T
	uBDnKWhn/v/Df6HL4IvlwSRjGx9FICXCcnKxpru9e2XbXhiPH8mHBgU52yJ/MYp2nrtMeGIOunH
	8ZxGHet2y6pCZGE8euPFw2DpgKA==
X-Received: by 2002:a17:90a:1581:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3a8c0dcd11bmr41627a91.25.1791354610764;
        Tue, 06 Oct 2026 23:30:10 -0700 (PDT)
X-Received: by 2002:a17:90a:1581:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3a8c0dcd11bmr41595a91.25.1791354610125;
        Tue, 06 Oct 2026 23:30:10 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:30:09 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 11:59:35 +0530
Subject: [PATCH v3 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-2-84cf4f861415@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=1442;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
 b=LWAPfyUHD/4HNyS4Ef0pdT8IssM4Wdd2mxGj3c1zmeM2ln+uM6ccnhwYAbiH+jzUPDZxRz4J4
 assC3IcQZiNB8/ufVjAWX6ahPTHC586lyxSXcUS/fd7k3rL5zptEc2j
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-GUID: S2ybfxdPpFS9HmByymjyT3XrJDJ6R_VR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX4iOMiz5m48+I
 29W56yoiaq5FQNXhGPgSdEXvdQHM/y0xfxVV28Hhx/jfdj9cz6sxLgcYvSILBBs0etLCAzuIDss
 fTWAMAj0DYRBhP9Q1ggcabzEyE8inc0=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac5e6f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7MUb3q_Ox69Zn6kGXoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX4cnZ5bciaiDH
 3YxH6bdXMDi2evckPXh/sR5KNSefLCRHrP+5+yjd1qs4moWXO4arbxX1czynVuEJDFek9PbZ73g
 daxRNRPjsdLqOIoj0Q7ItqOQ7QT3qEkkkdDSLoCB+XA0xHterKCuHj9cTyAdPvAYiQa1QsVSZ5t
 KPJZxiNWnnoylB6wqzVUm7Rut/QHsFdJ08b7g/HMV5AHTxks5dYrbGO3diZHegxmK15GlvsZlIL
 keqXslfpSUt+9EGb0dZgzo+rXH9l1c9o1npjOZ9G7rhher5euaor1qaPnwqLCKzKDNSJLXb10I4
 G6QpObB3wYBgytFBMuLAZm8UJ4/9z7E3N5KscKPu2ekBdPiJFp53SLrH/XWWuuaVoIs3vovNdw3
 7G9zGoHtTaKI+6ogk9baE8cgsg4JaoTWAf7ExLuPAj3pg2jWYzY8uq3iJ1REjZSkBb1Sp9yB6i8
 dkHznwZZszEhCf5grNw==
X-Proofpoint-ORIG-GUID: S2ybfxdPpFS9HmByymjyT3XrJDJ6R_VR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070025

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Acked-by: Martin K. Petersen <mkp@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

