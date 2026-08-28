Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E044AB7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924488; cv=none; b=PhKMK8o3x7zdADUa9uuJfVjJ9dHkuHjKM5AqaJvfRIBOu2oorYGFJjKS0EVBUIeaGl+Zg1int9KKybtFcNO8WnRM1rGp5T05eZs7hoXVXlqWz6Qxd29jaFRxF+j4U98iygq8+oiUyYChCHjFfuFerMPq8zkem7w0GGP7QGbyNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924488; c=relaxed/simple;
	bh=bDNekvoQ6EsvTgWcqctiw/kY1f4VrZJduk9j65q7Peg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBR1+/2HIz0Zcca/JPn6Ho2Wmsrzz6My0p/YaqdmcZPyGx6BdS7yXz7otUWmLo4mi2hQQVWIsniBAZCmg6dnZBbAlYe1CsfACqiQ9uZPKNWMo5cB6p8H/Lfmoq+RfDTl99kdmHevGAvuzOETdIkWVRQ8UilLBfjPFBVYmrqyAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzbakfeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lni2AoCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzbakfeu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lni2AoCm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDRhAF2015479
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mq09nfYXa4hsmaBELAkkYMzQ/RytSt+u7hqsPGWH3WY=; b=mzbakfeu96WnXKyv
	YmK8A8WrAZ/0VYMsMxp5N91II4PY7XuHwGfHv042Gj7y/76N/BlMet0kzW8E2frj
	/1sycB+8TB8r+JOPK7PhZmMjVhIEinbouStOD4LG3Z2GKzGRaVUSLsNAa7BbSEQx
	h/PxNhLPDM5ln9jftCP8PqoOXzr1AgAfOehcQfURcKrWdVlgMu+QWP8QWsJe9cKn
	QwslOPeg8EvkxgOMXg7DYQf3FhSZKL85vJcczRE+HNHIfk/Mgu/JSe7udhgLzLbY
	7wwxOAbiwOZc1l6+C7AnkwGGXq49CQqhUcJ5tXoay9ztjeiXhgFd7+StLD8U+3ZE
	BX5o2Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r78g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c6e562b059so12568e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924486; x=1788529286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq09nfYXa4hsmaBELAkkYMzQ/RytSt+u7hqsPGWH3WY=;
        b=Lni2AoCmkrPCs/UTfqDk96mxjC0DLD16yghqsuVHE4b/KTOvh1Ejjrp19HXJW3hkt1
         W5QeLGJYw9Ot10lBZrjpp1w4AMDAGhGNcKFao0nEZgBKlRZsv3osG848rczLIntB/1W0
         r6ycbpN3ymiumNbZxdmHO51WVDUQiKlS2/4vHliEyj9g4ZIl8Q+oSCizmrCSKC5JB0iH
         rOafhL2p7p+hQh5J1oFYmHU63++HLhdszeZCdar9BD9T9Bw3p3oXhw61ExeZKpEUnAgZ
         9zmUTKcr7puBp3M/GbA3aSgTPTm7cAyQPe0GN9JEdU7pz0Nujgdv29B9p99LHLJqeo6f
         d6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924486; x=1788529286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq09nfYXa4hsmaBELAkkYMzQ/RytSt+u7hqsPGWH3WY=;
        b=roSgz7T8xxJhm12s7WhKmROLOZ3d1Fd9CpLEsK216R4j04+OsZMIDqkEgJxxlJZbqc
         Ghj28Y1lPqt/BDbgFq7aUfCsXo8KhCVVph4esCTANgfDvnoffce8UAbER9ebSSfQZjvI
         hD/hBXlhtyYvMFWtMckoZow0NynwsnVMkaDRyqmFzsPRu2Wxufa3ilJO/JvoIy/m+8HU
         J+VVdhvqb8NVBFKaIeeKnaMmtELKY+9Rlcu0CWhtgRit9oMUY5jqCm/UH8vZIkHRB3QM
         B2JNLZfO7dLaIk+RVnZHRh/FaSBhbImv/4E+rck65vcmu5m7ACk9dwK9pBex2JX1Xc80
         QAnA==
X-Gm-Message-State: AFuF++mXOBDWN96QNq1tWXuSfZ+uFjR9vJ58UDTBEREjARrqCkTbZkGv
	H0P9JdUtIBlOpfg/DPHEw57q5yaaYpdg73WFUlKzjtNt+8JhiPjN5oo8mTx6k18V7esNkL/FUsN
	z68URqa0vCgBFESWypbGdvbatpYDBFwi2+iYM6G+H2GsZjCexA8I7LWz20NrJdi0UG/J+
X-Gm-Gg: AR+sD11yhon43HZxjJNXpHxudhoWCB5iyzrVE2l8U1hOSDr2bxf3p7jIQzRShzyvRI2
	wvIcymapRl8ntbcjIgmuxsJ42JlFkdb/du/sLOzovgzfOPm2/pPZ/tX/xikC0/wcgPCdjQgKCax
	wUFfeMtEWK8tRpKgvOKSMl53O1n+d4xuxfy1iF6ETkCj1cvofHdzS+0jxmW7oJhOTsytbKyb9Te
	TncNDJ6vvT8MnHZHgWrUStRY9Q0J4kP//j7TVXASN4JHGl+0/wnl56kGpivPD6y3pgt8PBVVUb+
	sLNqhP6Wbwh/dxX3u6n/wQ1gq/nxsiow2/Esem1ifnzLeKqYc77l2AY3EE/1hU1zD1K0Mgwc8Mt
	UFvSphkWchoDKveTKirpZ2gc=
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr904055e0c.0.1787924485669;
        Fri, 28 Aug 2026 06:41:25 -0700 (PDT)
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr904033e0c.0.1787924485232;
        Fri, 28 Aug 2026 06:41:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a30559cfccsm3004681fa.40.2026.08.28.06.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:24 -0700 (PDT)
Message-ID: <7b751d60-e8f3-4e22-8495-16dbd5163add@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a919006 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX5BuQZoQJxs+W
 wV1GaiCXOpwnn7BtYSzsOQ1lGqJBUkFSpv4oGg2MaQEmDK4NXeWj1c9B9tWi4s3tIy8A3E8mEir
 X9Zk7hQeMFwab4m9KMPiiwD7cR6RRgs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX/dpi/VZU1sCW
 Go+pGmXk5s/+lQigxwElnSm3NiGv/u1ea1nzN7OYmWM87izKMuwbyfwhie0ImzQPGcgbFuiD0Mz
 4jQubNePqB8YLYgM6aSq1H4oMjMIAWaTQa3HDGv/WrgvfXbK/JuM8ljxrfZQp8ZNKa5Uof7J/po
 qrI5Wyb+QfgkyzZTNvSvLsZh/T40SstuYLq8LDGzP3xOj+7KFGPg4Mutm+s1m8J5B6L5wrf8w1P
 1HMOlHEa1LUcqmC2aWtAQF8u8PGV4A5Jdk/jIioE+HwA9XXcSmSWCTu0VxvCZrab/GMOiLnFCEI
 gLaY98UMEqZzyYwO9GL5vkSVlij7p8S2fy8DDKmWnV4ZgxdqSq3FrIH3O//v6VvQISLFVwLBRfC
 rn8oCw0JpwAb9nScQY/lHh+HSAGvkis35ldPQdDzgT1g/9KORcCcWimBXFO+Ph67o7XThX9qcvE
 E0xscWRRnDS8qq85YJQ==
X-Proofpoint-ORIG-GUID: O0GcABBQ7NnSdeJi81BHJxSoc8joMzzC
X-Proofpoint-GUID: O0GcABBQ7NnSdeJi81BHJxSoc8joMzzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
