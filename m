Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C833AD52F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371721; cv=none; b=j2fPXS1GkcUAQ1TFjdCVeuvSLWcCAmnHLJ4PzUlyD6pf5TuxTA0t8k+jRhRTHs4ubEL/lq9u+0DFDnf2+X4GLT+tgQlnxH6CHUes45prSl5SIYRXmlLA3Z5fNX6z8SezU2WWfNv3om/hq0Ez4eOis5hKaiKKQS0bbf8sGrVF1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371721; c=relaxed/simple;
	bh=Q1hokslqC4SYT32xlfEvZcsFs7n/LvtyoimUL9fjew4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqK/wGGDWO8YtdSe942vOzwLN9GU/tKVe/ohcZTDerB8HyR8G9QBre1rqf2oQYPKb6gm4F10ebT7EyANPjCyGBLea5XOnftGYTMIY+5qEpiZxMekvj5c3vG7wkW4CqxBtTrW+T5IB+4wrr219bMv8jCSI77ZtJqWQcSSBew49f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWvRmRaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzKvvW6O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWvRmRaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzKvvW6O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifP73900798
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wtZ7FfvgKDC5aBEfkDDN2hQt
	g3jzbMYVITQbBEDJAp0=; b=oWvRmRaM7qi9PbKSlJ5C2aND0c6txT4p6bV35XAs
	u6DpUhPk5ElOan7Xhw1DWJvp9l8YhI85BaC8KQwrHLR2amIz9SxDHc+GSw77t0pG
	Dd0CPp5WFDtyuFZiliCs5SVuo8nj1loBpoA5k81hgh5rwEmbGKpEWEyZA3qAtns9
	rqr+IcKuYTaUb1gYDYW+dvIR58kEkZzrHWoZNPhiXVRf6eVmj395+1IA7pJfUKu/
	Svubu/1fod3Ja5wc2cfW+BB6h+8TEb7evF+d/UBOW67/jzXDrmJEXr5oftUxha8H
	GgALDhdHeSWXmiiJuMQZCnyKKow++nXaI+kir81DJwt3fg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5huc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso329036185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371718; x=1789976518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wtZ7FfvgKDC5aBEfkDDN2hQtg3jzbMYVITQbBEDJAp0=;
        b=PzKvvW6O9IFBCI9wygD/ou6Ag+VYYBzzYi8HQWPNyVt90zC7yTXgQqOMsIwMJXtI7B
         LKwIGZczPyesBuDWw7hjniGFieJqhJI8HzGCvJUVOCOXjokgXv/qVKDB2cViCIIht5n/
         pJyNj1Xzvss4vumg1Xa3bpJwzYCIk5t8UESxALxjfvtyQu8mNhunu/aco87YXFH+K91Y
         uUjuA8pNHtGlli3BMejSzlBBMKksvg/XlI4Te5IyudHg4I2UywSwILB6+hVfjC0xecj2
         fmnnwFS9u11mKSnRcKZJMxYDIJswFJ0lGHTI8UpTkMOuiUvKHuIS22OrmEWmXq3c9o58
         2dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371718; x=1789976518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtZ7FfvgKDC5aBEfkDDN2hQtg3jzbMYVITQbBEDJAp0=;
        b=KuWZU9vMwcsDMGVzSLScFo7iw2ZExmp4S1S8CpP2lTz9GxBGi1iLbGWDleOvni1kRC
         g7sv9kU0inRf6jeasmyBxXPzPIEZxrrfExUkhI92E+fsriojh79JHkYq+0KRoHFGWMz1
         CUMwkO7Fvu2waySYrmf2Cs00UZfLYy2WEWuNQZZelZABL0IzS3jxxkRRxoMyduYaGFa0
         mA0oAqpxcfkW95ONGWu5ENzMoGUb6iqz4jbGNp/qMinL4aHPpNfpApV33raxOta6SF9F
         oGLHxn7pNIa3I7HbViEqqWL1iC/BvVU5msfyjDuPo6UrGgedp3taJoXi9pLddNUZfNAi
         zeVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG36uWFBArhSdfJ6HIrAigQewEm6HivKq1cNUmBiqxOx+Y06w6ioFcsgQ7P5IQ1MDxILa0adBbT9l6p4vn@vger.kernel.org
X-Gm-Message-State: AFuF++moZS6SgeQ7CYRjwd7Cw3XRUvxjqOOEhXU4y9kbpUueD9/KagWZ
	N/ehIUGiP1bW24lf2fFia6J8pCru09ubmC58s6b3QLOR9Aa7GzdE0JZpWp68bscbqfZ5Yr848Ha
	TtMhcmvpDUfYK+1mDP7n1Rgd43HSnf0dJqatpx0eT37f+1loUcjI8jmHd70iWXJ9LbCzr
X-Gm-Gg: AYBFou2ci3xJ19E+VuR/qUxXdVwFXZfZvKh6zstiXON4yzGHWHRI8yj188cqblesNyi
	YXHEa6nhD7E508Z3zuVCQNQu7A/YF8UA7nHy+Z/VvECrYwX/4bYxY7xj+hNCXEMtg/fGPa8xS3+
	yRLYwUKBtDq3Zkl/WUusffwZqyfSzSLZBHgPQfOP7C+VSl18jZ0mFq934hTGqtIKDH9jU36kLru
	S2C5sR9/jvIYcD4NsRuJ2Fl0nAv4U8Z9XK9KHyxMvImLQiAY9OOHIrlylJgovBXi3cVY/PmQC18
	/MsgYvSoMlXWZFr92zMw804UPyT1tb+LP80BnwM95h10D6gxaNdmAWZOAIAy+IukrcB2cGbAOqf
	n021q0YrNF+s2doA=
X-Received: by 2002:a05:620a:468b:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93a298590edmr191390685a.18.1789371718077;
        Mon, 14 Sep 2026 00:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:468b:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93a298590edmr191388185a.18.1789371717600;
        Mon, 14 Sep 2026 00:41:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm26465151f8f.23.2026.09.14.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
 names
Message-ID: <my2qlwuuctcu642konetwz2pcyvtfslwrfab7wwxn37kbfuxj3@3lingekqj4qu>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+RinooisUnj1
 trX05r/atwXfSeZx1gPqwoQltituj+MiUCAEKb/1xt3J1jc0QFIsD2M8Hiub/aDx5uCT0EMjuSD
 C6PG/JODTL1Xf0un4wkd03Xogm2bF/c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXz57z7lRzmTVv
 0Y0w1slG55xDqFedRN6qGDx1a4JaZUjlergjbPTmKCEnp0dCJf9ME7mzAyjXeaJMYI4I3Tra6uL
 lINRrluktbm3FPz9MVIxs4jXhOsM5T+lLAdeM6YHciCh4gpLiYwwT2Nb8+YJ5gGFWmuoFIOH1IG
 6JYov8SYMgYSQOvsEs/TkMCjpFl0rcO3nYKUWtVNOSP5Glg3s2Zk3drJcAahDUtQjaA7TFMgmAI
 vGOj6yEIx5H2nl9dfSnuERJkmpTwWCkxE+o2FuNPqbY8FDC18Qdh5d5XPMkewX4bUDMFB3V6lAX
 UIY/v3QZ1F+BdPllFHiLzSBniKFSe+IAuVJZtuviDMGMICsqmyyq/Gy83rdA/QNq2iIvRO0kL3m
 B95RQwm0cauBWY8X/PuO3m1vPAT/I+RzIbSeMFba3xQ7GyQHBc/BwIOzGKuJSp4l6N0N4A0I5h8
 JpzKSEprlSCnlJNJjsA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a547 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: r0topdduAyRzF3fehfVG-TJWGKAxjEDf
X-Proofpoint-GUID: r0topdduAyRzF3fehfVG-TJWGKAxjEDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:55, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
