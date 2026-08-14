Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5CD47884D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734713; cv=none; b=k1Q/jhdqxwqQJtR7HoaDiGEBhkei1uwAtdRASysUvGn6YfZQNBcfT1bfYcOL3EL3QunEnBWzJk7YQO0ob5OOQoyXplN3fjo/OXmQgBc42tStHpm30xk/C0LnLuamNppEIF2vYOkJ6YD3BH8BqyfF6/dvbpGXcgZDjsmTi8qqWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734713; c=relaxed/simple;
	bh=BjSeBOcY1P2H+zL9fPW6h1srH2T17qcBy0KkYiQLuDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tn0NRr0bnD7Ur0TQKSjErfCKu+oesfME0gn1e9CcHUehgiE8h0nFcmBCL+mtperHxeBTABdxMllK48o8NnRFlV+S2kqS8DLW+5c3yDkkZqpqWleE04e9NoQcDuqQRgn8Jvm2S95VcC5vYzumEfDQHm6L5weKoKrxBwfvoIETvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUMRL2p2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keC93YY8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUMRL2p2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keC93YY8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EGhsq11053987
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SohSU0/9k/ZRs0kvdJIY0QMI2ZHWYJ650KSj2jQWXnE=; b=aUMRL2p2KrH9Lln6
	YWgnODYNOSTHKwJk4s0D+Q9T9QBJd/0Et5NsQH4vXvyLaNcWcjDsUjSVjEko3Nct
	aUoBqJ3lzVXyEfRdRAMLfbJiJh8U1SmMrgvtyuAdEBVWc+tGJYGbwYX04aBBJRw1
	3MpReoDBtYWnJKVNqdJh5ERpbyCXiOvpxMN/qMgp9lXhUHhxnZ6HNfYJQtTyGPBO
	AHVQntelMqHjQLysqwl13XZ7vKZ++K51NVq9txc+GHDQ1ZmhFwjxCj6zSgH4C2+y
	3agKuVpXftELbHWi36C68kkIsL5XCVybaIIsSNa7BLHgjCwNKmCVXRvyKScIKpOO
	zOTCBw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g25ub8u68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:11:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so1485568a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786734710; x=1787339510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SohSU0/9k/ZRs0kvdJIY0QMI2ZHWYJ650KSj2jQWXnE=;
        b=keC93YY8kSd+wKTgUXpr1rlPsUPKxvVbod9CDsgJJ5SeKhwhr0wHVPPEtyD7Ih17rW
         6G0Xi0eRsiltyt0UsJ09TyjpnLapQVKN2nYIVa3gOjSSpUBgIMS3Voltos/If2WiLj2p
         YxXJ2D+lHR0iy9aJRdRkb/CpT0tY62my/pjNCuCKwws3H3mvqvQwlxZ8yfEkDwmd2/pG
         ncUclRC+OBJFGVrpUMoGusfNKqEcJSgKoZujkukmOLHS5skfe7TusrQruAEWxS6IM3qG
         dvy8ZfbWWMrBsUFYcKf8qBkQS39vTasmqzRBkURoyqYm9t//r+BionWOvcjmc4s/FDi0
         09Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734710; x=1787339510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SohSU0/9k/ZRs0kvdJIY0QMI2ZHWYJ650KSj2jQWXnE=;
        b=TCbwHqEF2YNKqKUeglxxUJcZlgNW5ujVAJkCqIXYlYqroS5Z/Gp4kAOXFYJTVgOKBd
         aagKu1bEvmQma0TPkPPEoXu3AWxGJkDkyNGumc1DmuDTOXh60xkhZq+EV8Pt5d7aofpv
         Iy5acT6fhMufRWDUsEhXErU4V9oWOVgvi+HhfV/8u8+vj5nOpsqhdXdW4f+cinks9NUy
         6OELSn95S3hov6hZjLLghKV9qF/QqcdfpKmu2mbkOwyVzuEBm7jWCvebRqOspNIP1xmS
         fo0CgVPn9tNoGOcZurdgQ3yOqSEsHhnMjvMRui7n9jfsyoaCAALxwoKIsSBnHWQ5gSxd
         sRDg==
X-Forwarded-Encrypted: i=1; AHgh+RrpMbxi3XbvCFK7XrFJDf7Wiroeyd5RLlpC93YhRN7t9A4aXnKxYeLx7joI64vmaXoghGh6PhwhZiZK9wG/@vger.kernel.org
X-Gm-Message-State: AOJu0YwtlUupBjEGvPzTeBuYxkp9gENRXEdLm4G9KSrFA71ZgnzQZyDe
	LRWtDhHXsjnOxQTobZVWo8UAjSqlZI0/yqDXgAz1MvQ3QbgwUqFjQdPR2QVYX/YjnHSkBq8Q+ae
	NHCXZoIvOB/r09A5u3ydF2Ig+avSuZvzltkMTZ2UiMEZv3tlvFWVEab7CDQV4+4Mphk87
X-Gm-Gg: AR+sD10rzEJNXx4a0ry5lCTUbFA5s1ZOkUv+aUw/W44Tki4e1dpLZON2TzZzcA6QrOB
	AH4Wpt7LIrB2FHmtmyJbGQAkP3Rgfou5g//MFCEgr3FW6AEvJSnJu6IKw3/BlWdLiF6KKXjcxcd
	cUHDLIrwqyAdkxmSZm2ul0yX9ikGmw7ZYN+J+EXmL49RN1gOUgUdaJgM5XLMwm70aoOPMqyvzCH
	q3h3qs2VZ6zyAOiKzDawxOtplqdiJ6dq/BIJLJjXasACrlSALlI8mrY6CDcIKl9OU/IPqZkG99P
	JmWKhmPw7XGW38EP6e4QHkMkj0XF2qgrMiiZKolRon0JNHwka61jDzS7C72PFsEp8FFp7MJyqw0
	TNVRRvKzkbfLCp2/7I2qYltEk99f7Q4yuL+pnPoxc16p+d1f+73XS8w==
X-Received: by 2002:a05:6a21:7d02:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3cc71bbf3d4mr10521394637.15.1786734709534;
        Fri, 14 Aug 2026 12:11:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d02:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3cc71bbf3d4mr10521306637.15.1786734708928;
        Fri, 14 Aug 2026 12:11:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320c6be7f6fsm8152663eec.0.2026.08.14.12.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:11:48 -0700 (PDT)
Message-ID: <96e73102-eced-4937-a622-6f2cb5a32ec1@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:11:46 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Address potential out-of-bounds read in
 resp_worker()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        ruikai@pwno.io, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20260731152344.1905882-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260731152344.1905882-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsjiaycA c=1 sm=1 tr=0 ts=6a7f6876 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=DeEPClqeKu6msZ13zAcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0NyBTYWx0ZWRfX9JFCz88Sv01H
 00q10nXRCNcvzt339YtQJVjkQPMTWEmRlElLuiVNbugK7ZjnafF95/SHjIf7/l7JfcmQZjUlmzL
 djge2yAm4gadrTaU4gNgodsHcIpQ8FhFt22wV+cNU358ydehEIz6LrSG1n1BGeN0KVUdhwsLRqh
 4hep2kuJpzPVaMail32YHtlik7HCDlD5S77QdwnbWR2BUUT/wZ1bL9SssPQ3cKAkdG+zirwT/Xd
 N0oNJs7hsgBQGPMVCaeJecY72iFLpGjoT8sqyMPcu+dbLwrkwK7GpgcgWmleZa+XIiIE5KLivVr
 crxEzypF3eadOm23k0fF3Faxc/Qet+ge89krjormOMwbsmUMpS8ws28sHiEotarJB9qy630gVEP
 IdsrhuJ/fi7shvdgb1OzZTWIaBcG7MDFpi1RNBTlMGXtKMtWilNRjcz9wog6Q5omNvNClkJlXRg
 YzFdFgKu3n4NDasVnbg==
X-Proofpoint-GUID: 0n6ki4nW3TrBCArQ0kjjpJXW_k8AsrBg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0NyBTYWx0ZWRfX7ipOQHPsW8b+
 4ulN0YCNaV1rCidKTCH1MPTr+kJUudgvjI/mlG9u2bAFyR8GOQ0zdTsw/pTdLX2YlXSP90W6bX2
 67RPZaZiko2g6EFQucfiucfWPhsOsXE=
X-Proofpoint-ORIG-GUID: 0n6ki4nW3TrBCArQ0kjjpJXW_k8AsrBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140147

On 7/31/2026 9:23 AM, Youssef Samir wrote:
> Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the
> owner went away")' fixes the scenario it was intended for by walking the
> message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if present, it
> skipped over the bounds checking code that is included in decode_message().
> This could lead to issues such as reading past the slab allocation's end,
> infinite loops or kernel panics. For those issues to happen, a malformed
> wire message is needed to be sent from the device.
> 
> Instead of duplicating the bounds checking code already present in
> decode_message(), use the function inside resp_worker().
> 
> Reported-by: Ruikai Peng <ruikai@pwno.io>
> Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the owner went away")
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-fixes.

-Jeff
