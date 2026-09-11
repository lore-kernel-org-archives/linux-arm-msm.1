Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9354A3D3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145263; cv=none; b=TMW0eYmQ5MCDm3+BM0GZiWeYeo+zYE/az5xfWikhZckppu9B2KaqiIZu6Hx27Mb3XzXHr3SmML/0WhjIRXPfHfm2Y+CjGag4usv5L2oyiLy4aYvhET0eesGrtezOIi5XEQe5QJpZh1Ys014kLUe42qvVM2pPPr1I6V3W8UFIelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145263; c=relaxed/simple;
	bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fal7kaflSuy+UHaMaSQLIV1a4jRmBcq6GfXZ3dezYojQeRK6vRRzNyvqy+gDv3QlrAzu3Jd82s7A21KMWotg2f29qC+eZnps9W446W/7iIC/Yi9yIjl4kz0rH7+A1NWVk3hUBafDuLMTi6W1iaM7o1Uv2TqoC40gsqZtVRgexR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gyn0CnJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIJ7Vmbm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gyn0CnJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIJ7Vmbm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmjju3962740
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=; b=Gyn0CnJTq1DkJPqn
	Y51z7WA82r1rUVVjSw+LbPwKv5TyYcKkz/ER8mU91MT7X4QxRMV+s7DCpuZk2b5m
	52QXOrlDZyhUTlPPjDcYryL3lD2lXgYqecTh9a2y3mHAJVNvS4SrAP44gYjnYfLA
	c8i26qWnODbnPajTBDqIWpuY9iWqF/BtbyOa390A4C9PZLSXxo5PatM20nEESppu
	dyk61MmDwWXHDOQ0rN3CkTsjunKzvx7+EOwpjhX8CH9M8NPstxOc0BSvqKrEuLWm
	QauT8eHDU1bbtXYDjt1E42OGUxlfryvWXEznHF4qqpcUsBxT+Cpxfgyf0V5m1Ezx
	vav+Ig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbhse0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1473924a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145259; x=1789750059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=AIJ7Vmbmn293j/JNG5BRwkuyufE+ZkADE7YwMvZ7Fu/hRwzZk4mmRNL91+ZZpF7clD
         asShF4+/ZGr5NXVR8Os5YxmfRvHJjp+FkRl2+172l18GJstCb2Id5Gd1Sn8LYFc9yyPP
         1vhKGjcCkcGY9ewRblrSnmX9htOm+FYLfX8bSqY3RM4jiarpAn7S0ts9DZNWttONJfDK
         TetMf2IU+cDOaqHpJNcQEggYAO4s3aKdyuBJyh7MYKqzLbt6ZQyzE5Jv48uB/FogvUCp
         fTjgEQnCbmEkgOHMH0QWhhlR4x4GNt9NTLcdYGhA2vJebHX+rN4jhmmMfRYlFtaXhGK1
         pgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145259; x=1789750059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=nYt78HPJ9L08azo45XUWbqd1KxfEkZFHp9M2YxHaTKNZHKZ6l5YFgu7M44vfAWfSv/
         D8drOjQNR8C7LJwEgocA4OHwLXjTYCmDpsWDAb2qaVV19suxjG3G56OFa+HeMaDBpE6p
         i7tMXWVM+r1HKel8o1rBmmnYkcvTgIWko2nUv4A7hGJJZl9FVdSFQHfdieJ90EcFvf+7
         P4gAl4YMHiZPhdU+YTlpoKHLoEYM8dFrwrPFZe6HDTjuSJ9fqtFDEzVqAdVSuVX/Ru5h
         GGOQauWFfyldpQAFforGJojSB3ScTQ+jfZ0uVDOGdpTQGzv5OGPj4FCUuszqj+D3SNCk
         TLng==
X-Gm-Message-State: AFuF++mDQH97EFOTc3jxzQaAPfS5qD6ahRIx1BC0C690qadFYBtErczd
	eZovKasvcyec6kz3S9lQ2qGUKL5o1Cmip1IVmOwM74/WTogQgcWm1RwJFubYSsVx+fH0v2F9o63
	Xd+xqjUwK2wmmn5cJc7byEUNoN0rdCWT4Uu/lxYBRoiHNi/aAh3JyC0L35lqBZCrtSOzL
X-Gm-Gg: AYBFou1Zz56imEQMU6apRlJYAj/jsNueLT4apHcLxBd9EoqKFsVfObDX7dTmQLXOgoC
	f0WKLBaq9uetojjjYjqApe3rjlDQXcGG42dM55ACoFZwRfUKe3dIHHA+wjetRdzRQg0gC+JLT2U
	2afWk869z/ZIQtounuA0bP9R3gHRUfRPUl7nJ6H9ptpoS35OCUO86xHwkP/cSHezeKf3u7r/bIP
	4ZbF4ETIeDlJskrcmPXxw2uyrAZKdPQsIWI7OXvVg5j0ez8fs0pB24R83cOelBIXqAv6VQzeTjo
	wCk+yFUyYCZmh/tvzahJxFh6LZoDL4qA7SdZEBKPz4YJPllLTK9Q3wkqDFQy3CKMDUNcgTT0qeS
	SY5bV4XXELjB9twN54N8eQoKB5w==
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr8967262a91.20.1789145257202;
        Fri, 11 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr8967200a91.20.1789145256741;
        Fri, 11 Sep 2026 09:47:36 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:36 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:17:06 +0530
Subject: [PATCH 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-2-b9fc5e2ee99a@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
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
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=1348;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
 b=QnYHneeV9+kW1ROf5mDkfh/qHaTMW+7cpvw79FXnUfjg6WKLDqWbGEfXyTQNv5/QalqHBFloi
 lnGigFGogtsBtUzK4jB2uGc/GQkzYdQRUUoXpZmvhohD6OrAMiuqxv9
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-GUID: OI7AUeusSjNM_0AJZBf0GBtZmwF3i5-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX7lANcv/GDgj4
 YFghGD1qpz4kuRQRwfM1HB3J6CT6MmpQ736FBoLErFLsWho7iShhDwH6KNXPEjX3xaUlecdTTso
 A9lgvDMOi9IkaCyaS5bFt5XBe1nl4hLdp8wTLIpxBxvls2hoAoHeVRbsPFxCTyOlQY2uLNYqqYb
 QAuvVreTDDBmrPnbtljxsSryNy5KXjQJq/bAGwwC2n8oEsw8iKp6uEKym3/LbH1E0fn23GIGF5j
 m82Cee8h941uVYUUGZW1ZyYI/paTkwQxF3p9xjdVRTKnSOnAtJm9PidFcEkXWtqZYrZi+hcm09v
 d8kkfmVkNyxVpmpd2Zi+RZp4+nRP3nku3rAppdQbkKiSyk0atQrBsPj0KGI66M02n96+X41Vczo
 m46+WsqRGmWm97aC6FVXjuZjNfU+IeMn1RE1dtTChgLyhjXSlfnarhWr1Z3WvadvlpJywwBrjMG
 65il8wUKQJWLd2dQkrQ==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa430ab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fvqz0uoX0QqgC4h9zMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX+Sm0O2v6oi2j
 wfJMlEipTS3Z0R6q06UiAHEGyoeV+CZkzUoshmoWdP42BFOQAoPGDbp++Y8C+vrj0WzxD/UTon/
 z3/9vCq1itxjAxezmf5x+oZtechYSIg=
X-Proofpoint-ORIG-GUID: OI7AUeusSjNM_0AJZBf0GBtZmwF3i5-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

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

