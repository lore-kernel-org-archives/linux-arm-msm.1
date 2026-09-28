Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40623CF1E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622324; cv=none; b=KCqdTJSs6d8xuZxuGlcMoePrUFSomVcxd8mWBEES/Gsl2BXSH6QPsWUcdhDxyy0rnkfJgGG0EgonkBwfRtzF5Y7KvrwiHuuOzOyOzPsBGudWxIbbU3maGLoFDTG3tKQVx+jn6nytw1aj3ad8ygVuSnMCnl0UzyWM5isb93FmjSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622324; c=relaxed/simple;
	bh=YEWEBJ/wLzBusDv7u986mZJkPr1sOwP5tXguBWv1j58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+7uifecfjM/EIXwmYtpDqvqHQy4/slCElwGNNogntwVaJ9wbrGOyQpzjXMVTnxmNry6HGuApt3PkaqkXizd+IJ4KPmjYqdvOMM2prTZVg646uUdiN6ZUNrvOQlCrMZteWoM2JfIUfpAM+dIUFS6/ZrIcnsQYHgYc5b3sNwrUY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTksQLh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eobRru2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTksQLh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eobRru2b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvvFL819686
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 19:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=; b=CTksQLh9GRSRU5aC
	RkNBkiHcJRI7vkuzbXUnrgkGoX8I7HlKIE+HdNX9yhy8EwaM+Q6JN5vqkdKpcHEP
	mEI7zCQ16KNdzkfpOsPNQfq6FywVtWukivJn18kHmEi0YBB/4+sQA0vXQf4HVz+u
	y4IDpGwo2IhC3f7svhevQUVXTZI7MXu3j4dxNaW/9WRmgBsSZlaOQEOLMNfs2PyB
	ViyMR9jDPVjhPONgnLMD2DyYyD2K1KhelVxixgEm5+wDvG1jDdoZ9NlGkQoPVXyE
	IbpR9pNPWNunK9qS7qVg8rs7hPnLTz+ax30kmT9hgqBt2HkoCcebmSSoe8G5kYNh
	vJMD5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx39u75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 19:05:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5721307eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790622321; x=1791227121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=;
        b=eobRru2bSNv4UvNoe45rAW39Bc4g1XqOzLhqLEJkxk6PlYmrYntfPZur8JbCmlUFkk
         fbM1jgHevg4ALScBZNMwkSu7po+4QqlwE/88U1rWPbrswv4eBCfoKiA+HnKM7qyPeqEp
         AYSn5AgbeP1Erkvnsv4Lun9ftvPY6dysAGDMpxDBU3R4VrnZLbKouUmo9iuMtNV64oY2
         UqhtcIcxmhjyzS05kGuQ0PH75Ud0oswMqKpdk1fKYqiSatD0OzKpwCpNnObJfUdsQpiV
         zXGPIyr+hjO0TpTxHa3yfmtXHf9WK8lJIc2tH3dzg3svuq04hGc0TvbxBvMCvF4jGNTZ
         OBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622321; x=1791227121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=;
        b=oBMCVlOzsrbeCB04bwJ3KenjFRcytQwNAMV5NPw2IL9PE3mzBvc0j+dH/6DGkVZ0Hp
         PjQGjCZ0Q8DpyC8gAPumlkEYckBcVRgFIamnGWR4EAmAvPMNMzIUE34D497Di23a1ktc
         Ayn/Qsx4TOXIiUzBRj5BATcTElNcz2EuWVJ7nnqpzGLboWeL5oWEJ+A82c4lCPn6pcUi
         yILqBuXfJa2tT5RKWMtKu7qFStK4B9jGCqxZQMp3nAK/tnqtavi755UXssTa9okyx2d3
         8FJ/CRtisluwOWucVJf55eMda9nw33VjXj1wvcd6gkFiZlLDj7/M/AvHqLf04+y+SYl7
         cNIg==
X-Forwarded-Encrypted: i=1; AKwUvBy9Jah1w1UVHSTqal9j/cQoMKY6X2IBIhwGvcQP84pnsuNLPiXEW8iVGWzqqjFnwdEVvF6VJAuZmwIEfz+R@vger.kernel.org
X-Gm-Message-State: AFq9FYICZQjkgOr/NHK9UIl2pvT9+ivp5XdACzsuu+ldOQAWu7qUs6kW
	1IGtwY+9weFcjAecbdtog0Jz7848DZh4CiXJjjURIRBeV7jcCTO1Ey67ZGi3z3MPSSQl6kFhxDE
	dQaoeDSxwFFK8sPk84h+/mc+R7/HzzqyMf6MD+dltU6mOGGoyNT1YcQqlAyyby6SpnmW+
X-Gm-Gg: AYBFou37g2xpMIMGEI9UEZBqkc17dKVqMx/31JYFotwnUvOp6fukwyAh/dmy40gDeVA
	c70RN8H1EPLSwtxYKLcLJ8tkbKK56RCQbGLA1wjTYq7Ok4ZZFxL09VEgxMhEFqfkcUUKro1pcYE
	5Td8+8EfCeI1AO/9fteQCb4rtmm5LgE4uYizm+a2FyyjazRXL3R5l1r2X+wd77nYNTiVe8BpyDX
	H/ganHJbNUQhzyh2yxEbO0Uc7d8KplsSo7/9+fQBVkNdMB5jrsRXACSN5Ff91hNTTeiFEAyi4hm
	97Aeg6Tnx/YvfdUXhTWnKUyj3Nxrtncwc2hJ69CwdESfilVAciRMe7hYMUtOSt2rThtk8GsITYe
	Z4x8C+kUEGJhsVdxsZ7W4KJRX
X-Received: by 2002:a05:7301:2811:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34271d8d7edmr12283307eec.24.1790622320520;
        Mon, 28 Sep 2026 12:05:20 -0700 (PDT)
X-Received: by 2002:a05:7301:2811:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34271d8d7edmr12283193eec.24.1790622318728;
        Mon, 28 Sep 2026 12:05:18 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm37771935eec.22.2026.09.28.12.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:05:17 -0700 (PDT)
Message-ID: <fac7522a-a9c8-497d-8753-e8c397ad581f@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 00:35:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm/gmu: Fix Glymur's compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-1-0fa0bfd8d315@oss.qualcomm.com>
 <arnTH0_tjrspIymm@zenbook>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <arnTH0_tjrspIymm@zenbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX2atgOt9ozmlg
 kh0VcYtaeho0DsjU5xifIw9I5+IhbQkuVuPe36r5ESSaSjXzb1Xk6KJr7HSuDSv+kDUIIwwmv4f
 JMJNCNCUwMtd38QBryD6E32c7XsIVLfHlzXJErCzucA+WuzKbCubMsLwBsIneTFojLVqr6814Al
 7jCFDBrxF0dtsl+PiwkCBXeQ3MKdqLUMN2aqnyigte8I8etyHuBdDj8B8A70arkUyF4qy/Lcbwy
 2I+EmZCPD2BKiB+a1HLU5EsFO3WqUZqPHGbJLwndqvYaeOFb6b0EK+dw9IIuPxa0JBfkSSkbKKv
 I3CBnrVwWy1XSjKvsmzDsgz3PPy0G0yCRXzv+/6MgqTmPsNSW4IgU3kpG3VDpp/+vqH/5rO9v0X
 qQzCVNHzyizd860tlRK+950XWsxB+0+7P+X3urnmQFBqQHVaPWB4XjmLaCised7A5l45u9xocfu
 4vi7f66mF/dj9MWmhEA==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6ababa72 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QgEWrOWD1ie02Gccw6EA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Hoav8FckG9WXQ-vtPq0jTIXizI2vHIbt
X-Proofpoint-GUID: Hoav8FckG9WXQ-vtPq0jTIXizI2vHIbt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX6fNVQvHyJttn
 OXMoO2YAuHPwfbJo1hG+slePH/7o67vil62CjPOTyU91PpIJ1KtKg6Zgi/jvazdA6FXrl2RaxB9
 wFkB4kTrfE4ru3Z+J7lTIdTgnNrroZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280076



On 9/28/2026 8:10 AM, Bjorn Andersson wrote:
> On Fri, Sep 25, 2026 at 02:44:32AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
>> The Glymur GMU compatible string was incorrectly documented as
>> qcom,adreno-gmu-x285.1. Fix it to use the correct string
>> qcom,adreno-gmu-x290.1.
>>
>> Fixes: 7bc29d5fb6fa ("dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU")
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 9e459f12ce3f..f22661447e7c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -363,7 +363,7 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: qcom,adreno-gmu-x285.1
>> +            const: qcom,adreno-gmu-x290.1
> 
> It would be preferrable if you add the new compatible and then once the
> dts has moved you remove the old one (i.e. after next -rc1) - that way
> my dtbs_check doesn't light up while we're trying to dance these patches
> into the different branches.

Sure. We can do that. Will drop this patch in the next rev.

-Akhil.
> 
> Regards,
> Bjorn
> 
>>      then:
>>        properties:
>>          reg:
>>
>> -- 
>> 2.55.0
>>

