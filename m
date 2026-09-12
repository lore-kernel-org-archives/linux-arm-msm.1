Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950694BEE5E
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227134; cv=none; b=pgHnnAQAB2clozBa8AzYKtDHoRtiVULKdhvY7y00Ed7MMP985X2VLhxJFDBuZRj3S04CtDCaMJobfPForfLi2P63PrV+xQGj2f7HW2Y6BtOatvcuKTGRMSYpxZCoXQM60iH7dJqU6a4ZGougFDtnuYFk8KB/0zcH2iyRl3jHeHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227134; c=relaxed/simple;
	bh=kA03Dsr/1AHH0hl43xERedXPdz2D5bE29hNcSja11iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeCuHcWXahGxfIqEXF8jt6LUhxgtHQ95prKVQl+Cb85sjj+ljw/XzjbLKfH8yBuvq14qQ/4LUKK4Ae2MFwGD7L/OmLad3V+AbcAKz6SHBf4XlbSFQpQSi/0jV8OwBuuubHTd1Ub1BgujSNwL3rDwYgmOemMUHsQduXfOT+gOjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnyhJEI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1qH04rB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnyhJEI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1qH04rB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdgJq3249855
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5DBiz3xkQf+uQf9ORN1tCQu
	Bg+aStW3CqHxiKqhVrM=; b=nnyhJEI9E3IYeBxHDuIP/mBraAXITH56GgjaASKc
	9IuRE73qmmt6TOmsrUTPvc1RhVfd7Qgs5NxRlK1HERk6x1zTQxq8/IgcfKbcsrJ4
	+N3/67zGdoZFehzA50MeUrFVF/G1iWjzTzX6iNQA670l+8fCkgZqGyJswuvIZmso
	3T4lpVif4E7rTfbxiGDQwX6mIr+K9FgD+HHa+UkwFpTYPBZktIq+zOOItbZKOpEs
	FwGwr3xhOTw5wDDIS66/8ryyGNNTK2mBsBSv1mGtlFW5ewFgSQACBq+GxqfT9Awx
	D66E5XV6h/ESUrjEV4oxLRAZiTNiswktMVMQO2HKXpmbJA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c18na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:32:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7a3b3c06bso570655e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227131; x=1789831931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/5DBiz3xkQf+uQf9ORN1tCQuBg+aStW3CqHxiKqhVrM=;
        b=X1qH04rBEDZu0mVBvr6LLVeekxDrC/LywjOe0Dj1XiBx6O9cqLRICKU4Zq2sZOAjH9
         tfiRbFfdROREMXE+RFQFfefUX4c+/QpyUGXi+i+cEEIx6GVg1eUU+5sN9PGBC7O73mh/
         u7dxdSS8XcnfhcePkDqFEVAifynTdxwpFgpklTGvUecskLF5rtvuZu/4uzYZ31O/pg7N
         7/DT8t9KpNroqik87iNxdEZOHngn3dDirRfLMsXnfTG01PiKVoX9GMmJVlh/lMWiPbXQ
         AmONeaKsOmdL2GSM7YuG8eEYaG3XgZBSeJ4eWOcFZos7PUktb2kk9/QxOAZvIaHrE9qq
         hD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227131; x=1789831931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5DBiz3xkQf+uQf9ORN1tCQuBg+aStW3CqHxiKqhVrM=;
        b=BRDSTEsqAbuSwC4b6L8wN5vLsORTTXn7iloXA/CLqukNa8h0S1KcEatvGd5hb9OWRf
         WjnkptPwTsoRRvJPOy1fsEQbd+fWj5XX7alO2SbD1EJP4AFnuSeLrqFjK0iER5t1ZQLf
         0Rjs+JdF3Lb0d+2fGJigQz1Ed/+8CSXw6W3Zsog6xdi7aiNfFgoGWi5rCoUV2g34/vZc
         /mJWJdyDy4HXvRItD3q8k6TF5RFaE1Z+je2Nryr9JA3a9RmQZLz6l1Jx1NMM9Eb17MvW
         pPaxZp6Wvt+h4oRIPvMzvPZ8bU6aGij4jPHhQkyIi030U/zsHTs2JeAY7oHtshhnUsNP
         apvg==
X-Forwarded-Encrypted: i=1; AKwUvBzYxR1Z22dnQDrpNo5kQzc/0YE0SuRvKUzKFPaBD0K81WuAeo71TKLt1oMYBGC3Veftc3Ef3Hkmz8p5p89i@vger.kernel.org
X-Gm-Message-State: AFuF++nhDTAL9Cm4zDuLl2drJenLowWQUUssr+GHPZCqndokmzkZekmV
	TmLg2KjCb5Hv7TF03q2px15L2BiJJa4r80cgf3E1OSqHo7NFQucKE6QFAGstuk58QYBvXfX2t/P
	yhgrsqZ5G0hd3RPDEE/7BKeDnAz/7/OkGMdbBJHuD3yZ+P0sG+kLGTs9oNAwAXvnyLM9j
X-Gm-Gg: AYBFou2ojbkEEnGZvK6CcZsQXt0YTyCK8mnZNvgUO2Wp/JRNcRB7mtHW23N1hk2IHUy
	tTJelVopTnnrpoPsgDctg9PW9ng5Wrra4H2wv+WK2L5vt9SE/GKkI4DJQg8f0Otqjv+sSv/VL9m
	aI9XbbJKNOzcUCtGJWXo0tqezWYzRl4MxHKFybz6D1T3qK9aZLM88MtbBNs3Sz4JAEeIcucQIvo
	6XxmzT/pnxx5KogWTYkqcBjX0Rvnw1YtjniNAeDg2DIcU4cZ283ED0FIU84tuaL+E5OGZ6jtB7x
	g/sgNYiz9XpdwBAv/2K0manPcDMsS2ogc8TiDIag+6ciMHhZpoZS88oB4iQjooyXxNbwXt+JqqC
	e3zWBpBwX3FEiJg==
X-Received: by 2002:a05:6122:180f:b0:5c8:4bd6:fe with SMTP id 71dfb90a1353d-5c965ef7403mr2720489e0c.8.1789227130527;
        Sat, 12 Sep 2026 08:32:10 -0700 (PDT)
X-Received: by 2002:a05:6122:180f:b0:5c8:4bd6:fe with SMTP id 71dfb90a1353d-5c965ef7403mr2720349e0c.8.1789227129945;
        Sat, 12 Sep 2026 08:32:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm12842770f8f.10.2026.09.12.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:32:08 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:32:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Message-ID: <xzuh3522zh4hqck6kr4piauyzoyczbtv7ngnrjdn4rr5jz45r2@7uwm2rvm5mq6>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CQbraJyxhzpz5Avp6nqzNPufy-PUkuK4
X-Proofpoint-GUID: CQbraJyxhzpz5Avp6nqzNPufy-PUkuK4
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa5707b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX65mdFvoPcXbO
 0OQ9S66pqiUNcUifnrY46/uSk8bIIHJSvLFVoWNuHrbGar1XsDok01GS5LD0qHRbNpVoDgj/6xk
 TxVa+wg/Z58/QYO36MOe35CRQ4U7OOxygTvJ3c1VIHcN+o0G949y6hzS4U0PXfSWWS0IVfiW3l6
 Y/OtlMIys2HVV7PAJnhQKU76+OuwrHluyGIiJiJDB9JnS6lQm+KZwo9ZbFbdzSKDJ/FOsGCigyz
 HRe4rmezhMWo7wXVKWK0BxomNBhQEdL2NOphcfldVtQg92w0GzPQY0V2aFt9Od+5YMxRamEVB+h
 bEogrX8xz/ahehtQK8qayiqKnlevqHnNTMm76GATEMtQWpu8F8XjjX9d0FSEWAxIJDm3FGc5Dnf
 Fv4kFoKHR5AKWTs7gVG2SvGEwaJ4uApOk67+819/Jhu/xw+3lq/q2HoyXHBD+I4Te1UQAbMD3LB
 p3HZ+lQwbDSh/XfWYYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX1yQvdsR4p+qI
 DaSstJEIIiBMtbafJihHjqPgQVU6B92hzVVSbAE8+i9tBY8cJ/MvTmTRHoN5D7GljHACC2c5f4o
 2LDBhAdWPI9tL4VraVU4SFofQUHQXhc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120224

On 26-09-11 22:20:38, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.
> 
> Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
> PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
> into negcc, which so far carried placeholder zeros in their place.
> 
> The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
> QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
> out of reset with the rest of the USB20 tile, driven by the controller.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
