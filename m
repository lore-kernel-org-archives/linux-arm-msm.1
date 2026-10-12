Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BCC36212C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811978; cv=none; b=g7mX0a+IQPQeo4NWAEwmUT3kNUQ4ireKFU6rzqfpvQ3zrxZ/e7tssOcuQWDW0AphynP6+5fvb2WLle0mY6y+UToSTkRVcJ7zE6jTZj8GUL8CS8Y8JmiaPRLUpmDFRj2B0iAW1FOqupWv3r3hg0whsj2bv2Is/rFgxGuMj1+TLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811978; c=relaxed/simple;
	bh=iqb+qejASsv6muwZxrMr/S5vhLSFvP1vcVumV2XPiiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJM07rF9W5ecqg1yOAOcrpvsfUEPFq4GNxJmmbiZd3+V5cw5BS4Mz90snYouTjGeNBfQ0VQPJy8nrGjBwD5z9NWUtU3ndU9XWF1iVkIHLeWOE+ioIRQDGE0CxWKq1p6QRmbxsJ4z+DQAmRaSXqsTTJ72vqQamI1bvTH8+R9Q5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCLGc7LE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTRoSeJF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCLGc7LE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTRoSeJF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0SCX1686704
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1IjNtEMdxjbwDwuNpcU6wRXEZzlvZfdEKgYGqTYRAI=; b=lCLGc7LEXCK1uWmy
	HqD22Xn8MbL46m3I/dpxvDbRB5HvJCdFaakmKxBNvvbk7Tr/JLiiJla6qspz6dKp
	J00cCffHC1/UCAD9YdKlYfRNb1Zsv1bSa//q0j5sC4XMvEtxvD9bDKXUfURllH67
	aZXh4l6uozsQLmERXkHOotpweC4KOH0juzD4/NaDnYmBeY3TgTc743MHBO2w55Zj
	jcEjv60L4WNiCZQwoDhtKxZzD+O6c5dlLkN9SaD/CEo03QCJ5tCiDez59F9Zdj7o
	xPuHBMkNbFe94VLixcLPY4HoxlFXQuPbNcJSeoa3tq35X8Hnio41owm7yGHVm4Fq
	6GpZRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0ygy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:32:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso3167074eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811976; x=1792416776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1IjNtEMdxjbwDwuNpcU6wRXEZzlvZfdEKgYGqTYRAI=;
        b=dTRoSeJFPiDZ1ZU2BZu7uOngfENaJ54VtHX7yKns5BqJ/HIozDD49Kqup9cj4aH4qY
         JHlnoeqONDUL6gQbU6+QkrZya+lqh1gyP+HEvwizYMSS5wMZ0ZwQ3akYQkhbTL1xOvGQ
         iuCoSRvfL021hiRDtn8AttT0inHHT3BzB/dE6OptHQipZyW9liCx8aqbCqXBhHAjBPGh
         HwLOZMMRKmAyrRAkdIVBgmB//6aeb5XsXCMS3eeixn5Ce5bQm0OdOM4P3z+6Di439V14
         V+Oq8sGjzZ1midMg8iuSsZ6o1lDY7bfVEcElX8u7Xo6gt4cJOMfVifs2rIF2/oabygMJ
         N0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811976; x=1792416776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1IjNtEMdxjbwDwuNpcU6wRXEZzlvZfdEKgYGqTYRAI=;
        b=YG2suzZ453mB2x0WDBuS/0vvLckUZPS9Bks2HW4KUzGpDIw5+iurBzo8EGMS06EiVl
         m3oRNaGG/R20g619Nrv7oxnKzwczRYRtBvebQvd+PU+RONgWc1phfp5jwWUhZ3ElFXU9
         I4rLV9ncSgtygffxto8Ft3mA3DVQaxDIgu0SzUq4M5EmGMAeTTl8ow9Iwt3NA/1gyJ2z
         4a39yg1wGJGqKb0EJfzJpCQio2tGbG0NSVotBf2Wykz7oqi7yLsD+34g5hWx+0DpgFhZ
         vwqbMeOzTdFzoMtzJ6hfVpPpUCW8Yta8HF5+c7TB5jpoPs/fPkHVbQ0Szsh+Sdc3+kkG
         jqxw==
X-Gm-Message-State: AFq9FYJeGpltm+QjlzPJfqri1tYUYlXgxOGK/8QCoSNQ5b6g8wt5KpFv
	/+Pk2OBvLIWalRHwwQxsXSePvWXLdI4qok/+ZkAbrrLKW0HU9sH/ZVt8tS3d9UAT5liFwKGtsyr
	9TsLBEND+vtOHmhtT1ZpJi8svwuaJASL4H0Q1JV9VKa6/sP3mDJ+anM80puMR++y/si4N
X-Gm-Gg: AYBFou1dkkGkCL73SENX05Ae+yIywLu2FnPLH8BUIWjlfThDAc0ZTF3vI9lpVlC+R3N
	8QgF2EvOvQEBuKh6fkpEauPtvAmkkgT+pN23EnQzrhIi1Ocdp/I3n16avp26tqTC7nUo2yQwKtG
	WxEg7Aig4lZswLoZKIin9yL0s1bp/tAPSn78TylOnLre96PHXocPQq0LXLtIZpAnSJ3YM5vdLcj
	NaYFxgoc+JN11JrfR4E8slJN4jk8txhx1JWxpSWAI/omgz72X9xTQy/5V4ywiT5EQ4VqkVEN2bn
	ndYtT1lX1ZsjIii3xbbp4JJStDBReJIlUGuZO+bG0PfbY10iewet9d2C4eFVZVHRPzmjc1mRzbn
	goG8m98vjlYAG9R2zrFY8Fnn0E6g=
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr18413023eec.12.1791811975567;
        Mon, 12 Oct 2026 06:32:55 -0700 (PDT)
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr18412982eec.12.1791811975006;
        Mon, 12 Oct 2026 06:32:55 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:32:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:12 +0530
Subject: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1467;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=mVpP8pxnU4255kU6h5VkhP1R63UQvGKZmNqAt9hXj2M=;
 b=LD0OMDaEEh2++O5ZlIhqQ2YfyYZKek2XbkJiqhtEHPi/CUYUHDtQ7ubnfsfN0NDscNI8kyXgQ
 Jjt14Bp7vrdAvUiKq6B30/SPLabJoaJNgxD1DOioHI1kDI/usPzIZNT
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXx0bteXEyByx1
 hy+jptRJePcIyoouehxAEp1Hwwqnpb+VR6tjG0ee6PwcUa+qBqugvjuwu2WcB3e7+hLUlEbzccW
 fKiP4RY6DXxu24qjvkEDYaW3elb9vQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX9HhbyOvso1WI
 KbBSaq+cOoqKWtb0wbq1RvZPPXg8fQBSfix0UPqqtg2Bu5sUOvEmzN5jlSFW42o6xqCqsbJ5pGZ
 zc5jUHWxvAao7bi4RgdIzUN7ruPvWdwzVjc1AEPp3xwHiSq21Lk9jL5Mk7+eCe3QX7/D9gwcL0e
 pfKHjcWSuNzVjS+AVJhkFvZs2TZETD5opeJ3q8ZJTgaPdZq+v/SzCgQs+LoJzh1S5UoN1Q+7OYl
 qsmhAdbH5aHsfAMspg5bt0yRCM4D5ZomwauN90HBY8I4upuF1yh869OTQ5jU7wdzJtyOncaMHgp
 0uq6UggK5Y1o+Be6jAFszprXwoYkXBPOFxg1B193VTFDKZu/5cA9fAwmUQjQ0DoXbNW0pyJUmqr
 F6lVTMiW1Fbxzi7/TVvTAoCADnTy+6VFtIbR7erEd06p/LflLOa9NTWIAjn2VF0EBBp4WsXaqUv
 dCOlPOc1ndzjsOd79Sg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acce188 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JUH7OfOS-bFBGMyep_YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: TA9QEGgrgbrGVR1vXB_byieU2u9OQpqe
X-Proofpoint-GUID: TA9QEGgrgbrGVR1vXB_byieU2u9OQpqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord uses MDSS 12.1 with two independent DP controller instances,
each exposing two DP cores at new IO offsets. None of the existing
compatibles match this layout, so add qcom,nord-dp.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..fce8b962a6b8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,nord-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -209,6 +210,7 @@ allOf:
             contains:
               enum:
                 - qcom,glymur-dp
+                - qcom,nord-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -315,6 +317,7 @@ allOf:
             enum:
               # these platforms support 4 stream MST on first DP,
               # 2 streams MST on the second one.
+              - qcom,nord-dp
               - qcom,sa8775p-dp
     then:
       properties:

-- 
2.34.1

