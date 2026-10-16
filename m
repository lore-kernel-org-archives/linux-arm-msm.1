Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83286372B3C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147807; cv=none; b=pOfeDz2WSZXEnHeDexy9Rb2ANCH05MioZKk36nuxlvNbxptMwG26kzsuu1W7S2zPLWQ64UBJigooNQtd3T7ZFABPy0JPNM+Z3ZdWogSMhBF8xv6j0Dsi+00worycAwmcAw/pTdAhiL0p4FQCQJEvJUh2vNvUHCPcZ3EffAXYI1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147807; c=relaxed/simple;
	bh=U8xUhBZ2f/kkhuBOykgloPNFWKazFRIm//qLiwVE7iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pe7Lo2Oz331Fc/+EYIjcCglB2Y962c1GfMXmzJdxkLnEUCXxPHmWMJKSuaaYJBJIXxP6wBG7g4F/I0hto5LVH6hX+ljXLcfxqt9HsGEEPZ325xrKTUeZSP5GqrZoOEuVIu7AxjmcgaZPexfY5lYv2gMfVULODSuRzIln1+LExr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDFLm7WD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuSQ9o3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDFLm7WD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuSQ9o3u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAASD53069341
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7IjtS+liWyVhegtfUxpKcwt7nA/GvT2mnO8kEfaBY8=; b=KDFLm7WDjdFSWKCn
	JLQNDj/WX8//nfSPhvhauZ+5hauVRkFliSfKHys8GdykmrnH/VpPErquCJObScfh
	8bCtnsgGb6spti/bbDCq+y5PgE4ZD0DqCDjO7UHd8wR6H0CpNf78rJiFvaYs1wlV
	6qQYAg/7rVA0qLyJreQQRQDXLIvlfgIXQxhAR/ZXCii0S8I61GlNPkeWQsQjce1a
	+dQqeh67NcbuqTKPNHEFFr2jHXxk5OUysbvyrVywfn0ITtkfVRkB25tOeY3HjqES
	3piShFQ15FYNq2R2T/U1UT58Do7biODm7pGMgGTDYU2mTcHyrSoWPAxYVWOJxhZ1
	LYtaHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261xru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:50:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f0aa07824so22675985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147805; x=1792752605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7IjtS+liWyVhegtfUxpKcwt7nA/GvT2mnO8kEfaBY8=;
        b=WuSQ9o3uyW0OfHuq7Z8Uxh3JOtGTb+FmbePUuhFmtWBqXMsAUA1vubWDKe+6g9EncP
         lPt/vWJcRqOqtUr2mh0hvYnL65nVKVe62v7Wh9+77B0jvzshRd0vAgGv4RyoYYPw32jF
         5za1mROpHxH6KTrLXOcIThl0iPbrxTWUuXO8y318RJAu+XAZxMhEh7tCfBuf8ULj541q
         /hXtXMyc7x4cXitEUawP/lR4172bTO4Dxw7l6qCnxQO+CyXnc8tF9c5jLgAwaEXHjCmE
         1YHLsD6eJX9PINuYFVUv9l8UOkHJeWrVmZpxfxPB2osxG4WIXpywfUfFVoqhE7HJqwyB
         cdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147805; x=1792752605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7IjtS+liWyVhegtfUxpKcwt7nA/GvT2mnO8kEfaBY8=;
        b=bj6e9MvifGJ7uo7p6Svx8VpVnM5BJivKhWktpvULUA296BZOKuMTFnKv5xu8ztAA0S
         XQ8PksFVJxZ1KiFm+kX2eQC5CPkVZ+F5IXAetanNQRuHT3oz7rVyUQjzM3sAeXbKhcOh
         CwyMxkd8u9Qv7aM9uAwWvQGkQJCybhJH/jqkY1KaBsMsBBAcztPhxNXh5zGM93t5jQOk
         PnmCtbXqUuaWmchxS9ktdmNrplcOeMqC0iM2wYMTwLFZ+J2PC6FphdoLf0uqvjnyzrPD
         fSXuEO4TW1oqdi5dPtynOoTUqaesSI+jVV2BM8OxwfDUp+9bvyzvRtXjnqHFccpIvNeu
         qRiw==
X-Gm-Message-State: AFq9FYJbiwHGMoonEThionDeLW/zIuQvueoh6IplzopSAd/mWrWRpHLA
	hOl0sj0Y4GuSidLTqz64uJB+7kUWkAkSWEuu0c8eFOqU/xfPbOjJVunlmxspq4ck+F2vCpkW8Ak
	S3dKBuY1YN0ltpGx84hqh9bEHLqME9PjAq0lZB2fbyzmAjksHqDXyTE51UShzSuUutP0c
X-Gm-Gg: AYBFou2cnpkHuR7yiurfTC9RR52dKdVxKQGD0PPL2dgswH+D0mILA6QlKhPLnZSMsj6
	s1NYzZhqfzUq11xBlr6grVh2ci3Xr6c20NxlF83d3yBu/ppXlrMsVPaZRzCLtKmMpnOsGyhGaxW
	Sl7hhIZ6KbPh9UsaSUBgxt9gjUHJavhdwTcvahCQp+FqxN7I7B+GYQzJzWs80xfYTqHSJd22SM2
	/bFoO2/iP7ppw9cgdaKI0wW5Si3rWqKRbFENzOr37FLPBnLacnavsJe/36r+uk6InX/I6rZysXY
	zxfFxQQkWEMg46fSuR7HGbVzT9ZPA/UqJrKA+ua2z0QCHfLeyUKiVf6X2oPg2+jDr2cR9+D0tBD
	sGTT+3Y7XiB1EsKXY5V4dZA==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr4072003285a.4.1792147804521;
        Fri, 16 Oct 2026 03:50:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr4072000485a.4.1792147803965;
        Fri, 16 Oct 2026 03:50:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d8b4csm750199a12.26.2026.10.16.03.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:50:02 -0700 (PDT)
Message-ID: <67366b4e-21d8-4094-abff-b0539bae47c3@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: qcom-qusb2: describe autoresume bit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
 <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad2015d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ma_R596jXcS_LPZDPT8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MyBTYWx0ZWRfX6beTSxJ0ky23
 iyFTEiiM/yWvMiiZW/pJtI1KzcVfnIc4UTizR2pcjNZ4LHsV6XzXV8j/W/3MHzvbL1oWeqV13z1
 37Qm9nQlcKqrTfFCbtkvFyV29pu/0aGNID02opE/PgVSvryp/i1TwdotN+qCP0V+BrXVxadg8+0
 9crA7u5lSofWnCi9lec3ii4vV9FXRlPvmhE/yokPDTgo1KA6h0yTgurH9kUdl5v57GFdYnQ2gTH
 UOhXwLeiPLRzcfoGX/ImE721n0LLN/eIX+aHbCXNpdF2k3iXRUjvTALH4/lca1iVrH8giHr+XhH
 uxarlz8bZfwXH1rPGS5FhFACAOiaNaZ/W5L48+7oeNPuOsHjqOd5dJNniazJWppTfVMbWy+gBHg
 VPKnQD3h42gZZsr3OuxMKkc/MMY1bEECrbPoGgk+c3xdWir8N5vcQ08UdD5qtRDWEx+yeLXuZSs
 admh/LGph/1u4zJzA9Q==
X-Proofpoint-ORIG-GUID: sOvAs9fgOPMjSdWAWgfcscaKErMJVwie
X-Proofpoint-GUID: sOvAs9fgOPMjSdWAWgfcscaKErMJVwie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MyBTYWx0ZWRfX+IxohWUbEABq
 /lINZ8AEepUzM1fHY5ygXdMdmChVXKwnNCtZHcYxTtbgtpJOAUIqroFeT+GgNy+dQxIG54PHQfk
 I52XVxT1zL6zBC/vAtcMniOOsscy0KY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160043

On 9/20/26 3:59 PM, Dmitry Baryshkov wrote:
> There is a confusion regarding the autoresume bit. Some verions of the
> QUSB2 PHY have it in the TEST1 register, while on the others it is a
> part of the TEST_CTRL register. When adding support for autoresume bit,
> the code attempted to simplify the handling of those registers, putting
> both registers to the TEST1 layout entry. In the end,
> ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
> (because platforms using that layout didn't use autoresume), while
> msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
> layout entry.
> 
> Update the platform data to specify the register to be used for
> autoresume handling, define both TEST1 and TEST_CTRL registers and merge
> ipq6018_regs_layout and msm8996_regs_layout which become identical
> afterwards.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

GPT has a concern:

[P2] Preserve Shikra's autoresume behavior

shikra_phy_cfg uses msm8996_regs_layout but doesn't set
autoresume_disable. This adds TEST_CTRL[3] to the shared layout, so
runtime suspend will now toggle it for Shikra whenever the PHY mode
is valid. Previously, its unset autoresume_en was zero, making these
writes no-ops. Unless enabling autoresume on Shikra is intentional
and verified, preserve the old behavior by disabling it for this
configuration.

but I think that's fine since we *want* autoresume?

Konrad
