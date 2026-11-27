Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781619;
	b=iHiEG1PhfglOuqzD6FqPdCH4xlmLlDzIYtjCBVSZ38akT62YBzJeTB3yZKk2xYlJ5cyQ
	 baY3KGZxwpi0SA0B3nNzcM/9HsJz1a0UkvK8MNE2UtlWzaZzZgKlPVKFcepGgIOMrMUDA
	 LTgCRODxZNz7Njzk3g4bVZqiqBXbO3YQKd3N0bhCsuz/xCWstyC14VQbG/Pcrgztn8jwa
	 z1ujIPvjgWFZ48dpKDFE0OcfBdsEPvK3xJaC4H5ituHr2maq/ZjsfsP3kagY4p8KkiF1F
	 MNQFsZiNqGpGwgjrLEIILmRznWSTjf93BsJA/v9v6y4Ur1z6xvvM6No+kl4GIJabUSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
	b=CSgjJuRsbiwS06zLTMoPdhdJiIK28WGMMxf96/efQPuYJ5NP4iJVNkTrdG0N67Tvosrh
	 k/oEoKcM+wrs8qyuyb7JOsETOAnFLz6x/d7J99yPz9nPdyKVXIiIOK+DeeVi3tWRaG7mN
	 1JFPJ96+FE+atqz38GxILzoyTsy1Ra0gAL7u4Foq7u6UEoUADNy+2qvbz/6JiCIXAQWwt
	 J143D0TU7sl3VKpFPnnpnQ72O4MMK8P35A8DEnjHQYDSti+DaoLV++1+GiJXyD+mAZ4M1
	 VonVVtAqWFYa6tlNtwqr6//fORCd0udurYE0izdvljX9MqV9Ywo59Vu0ZzD1Srillsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IzTcYT/o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A97606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A97606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzTcYT/o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsIAN3609921
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=; b=IzTcYT/ozKMWXuJA
	qR2A1WW6ceB8r0S5rRexOAaw82FLGR9RGJL2KY1QkdqwqhxOyy8+EAURlkYrhvmd
	bjyzWZqkIEJQRryUt/C0tMhcxF/TjRuJdu3CpvRmL4ecVAtogGaVmu8Jno+f6yXc
	1D35w2HDNHULZb9fFmkEdlU/ey5qoHhGXXWmQ84kKqoOrd/u+VgeVOdFTzXHvTTM
	5tuCqikXS5HG/dFoCJ7o/VM5gf2SqaMLM0AI/WEYe8yHvUDuthglQhyNU9alv+Iq
	oT5NKBdl9W3LAoL5GNm96tf2LSb2BO8r3kIpeCe8oXIZs8fLvunOWPA420dvhkbG
	A4NYzg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9jbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:13:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso318365e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781616; x=1796386416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=cKnZgQSD8br2MGLHVo+K4h83QIzyW0OkHXK/IcSJtBaa5Z4bSkpAUCioYjn07Yia3Z
         BPNeKZJDUB3QQ54qdI3C4nbCyov8n7yKrhWA8wqB7eRRAjDOmL900FWP5dt6XywAOMPp
         fW3S3Pm3lytDYqjEXwbAT7u/0Zx5NiVMjSWQo90ZNjGWzKQX7dvrbZaKo2Q5x47hdxJH
         EvXtFF9XsS51AbB9tZpsW1YTOvWAkSQQhCpI2rdXp9E1NRCP/niQg2Hjtte0bpUenfW0
         lVnyK3G9GZzr4TSvo7hLrejlYMqJtKE1dSZ5M0MQYjllKypzkwx+qS+STFUSAiXbIeEg
         Ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781616; x=1796386416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=JDD/uCweamLGo31spMojO/paSmRXgE7Ep5p/TVNuuPHCfihCM+pQqIeW/SUncjvfAu
         ab1kwxJX8kjLIhEg2KUQhXzSKpjnQxcEzkN8f1EfzUvV+0Yy+5zO6/ceyg1p5PXDL4Pm
         lDQKOTr1Wi2RTtDgq8CUn9xIxToOafxrk9v/DUMVFNJiuiaS2jvvv3RA0muUZuXYEYcB
         JX2+ifAJjtgZj5bafugYINQUHai6GSzHECm/sZCjb+E6xYCF/NggqCtubBqHhFV670OL
         0aL9/ZMyL/lNUhcfIangejnm90i6HT7W2T6bgUq20ir4gjjZS5cpijEFNmWde9grwgwm
         HIgw==
X-Gm-Message-State: APuU4Z90SZ43j6nDLfVz+jA0UJh/DE24VExEArKjUCdqYUyz5Wz2rLbX
	+/4UZ/ikDIXDHEbDfy+82lNWrUcBdFPeLhJE9pl4fZ0sBYmhQfw3IExzCs0xnTkKtsFcQYlkX+7
	oEAW5v4Lcm1Y3vZFH3mhtvfkkgOQ+vFs1+x5SHsFzMCUPRx5DlUgRAAYGDkUR/eo7g7u+X8EkUF
	9w
X-Gm-Gg: AZFdTZcpEyXSbqdBWTagfjaGCWRn34IcE9Jn/ZT3V6+2jygSbycvYZPHxy9J9tbJ3mh
	0lcCy1FvaX0tq6DH4aG87z0CguJZOd5Gth0Pn5d6WfG6pyewZJvv6mEAqqMteKjzAs5vlFQgC28
	Z9wdTfRYvLrEdwvD+AhvS+wPWEDC9m3/iaPkRDh0AQOjkMP+qtLCIG1TCtG14AWiTw/nDo1suaO
	uLmNelApIuO+pn0EVGls5R1EMSXsb3PLxPjijjjaFQmdlxxfDTSWEym4iCJdjp3UYoJHc/nUnm7
	HxAkdznw77CeJqH3R+ImgN5muT7YrlvmI8Wc9fTLlV3NC0Azlzfql6SGeFgJERl6InrXWpz1Nlf
	Cs5QHKJwaOyT9c0T3EudHxsxvW9b1U7ZqSDAdTGIgfoXgvfqtFMSY4bV+6gU/f7NnBUVyfmM=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376761e0c.3.1795781615869;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376707e0c.3.1795781615471;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm845002066b.43.2026.11.27.04.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:13:34 -0800 (PST)
Message-ID: <c3ebad86-3421-4941-bf64-e400dc8f14eb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:13:32 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add
 sc7180-trogdor.fitconfig FIT config file
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
        Peter Griffin <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXy2MPtrFOB2sa
 Gm1HOyeV8I6FTTLw4nWJRowzOCwutkoo+HcaZbp1IgrTHmtfzECcOR9iH0E11LTXJEOHi5DeJ+l
 uFlP88AixBxZYmJ+8/hfZ1kWmK2C0aVoHm9qTO9HWYfBTa05OrjvN+8FQET7PG3K9DGf20cLtxp
 NqGXnDrhcQF+n0PMteS8eDs+9cl+gEQ4IW8T5DPWEo1PgaBa0RsStPCF7dQf0OwIX1hvzHRiw1p
 /hEDyynpIp5Ov6ZMuKxZv6YxsTXlpUwFKt8vy1cSUPNl/ysn0WaMbnERRyLW5jlxqQ8qFcdssRB
 J/frN8aQjEBuoepsG9cO2UqiuuN92Ff8gRFo92Mds5X0USBpmNalkaedfecwWUpC3wIvd5XdDRm
 j/vcJtx1piQ18E7ODCqZJUJpjpn3U70l3ZIPs0u0sXNnGJWHdWMIb7QLcGtUIW+fp2kNb1xdjV0
 jnth+VvzSmogoJM/QeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX6naWJsodhtfQ
 QM8thxzOrlYXVKXrNAgLHllHnjTobJqLuuude8cXN/9v/T/nwTrANkYgyQmJfPs/dEbfQvz39rg
 vB5eehtcdi8lhKtO9McWkjjx761ajPM=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b0973f0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=kMGPIAtnrfzpPBabNyUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: _ufBT3lVQLT0jExysGisq4GfKUJ1SYmN
X-Proofpoint-ORIG-GUID: _ufBT3lVQLT0jExysGisq4GfKUJ1SYmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270048

On 11/13/26 10:09 PM, Douglas Anderson wrote:
> Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
> SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
> FIT image to be built with:
> 
>   make \
>     FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
>     FIT_COMPRESSION=lz4 \
>     FIT_FACTOR_DTBS=1 \
>     image.fit
> 
> Having an in-tree `.fitconfig` configuration file for Trogdor produces a
> FIT image matching what downstream ChromeOS build scripts
> programmatically generate, makes it easy to use `fdtfactor` on the
> Trogdor kernel image, serves as a template for future Chromebooks (which
> could encode board/SKU matching metadata in configuration match subnodes
> rather than combinatorial `compatible` strings), and helps community
> users building upstream kernels for `sc7180-trogdor` devices.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
