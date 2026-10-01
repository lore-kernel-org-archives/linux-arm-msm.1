Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9013AA1B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833420; cv=none; b=ErllKsPTTxw1EIuOYQjWDz/EZa6yGsK3VIKoe1O8vf6IpXDYdEZ99dPkluxc9pVOoNkT+y8bz8TPOYJ804xI9Lmclwf1M5UNn02Au/7BpErOWYipYsvijRkH53EF2t+rOO3/lgCq9GzjwHzbdLsep1adgckEVTZopKuvx6qFvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833420; c=relaxed/simple;
	bh=rcxUxarvckFEbzwc+77lGqnMQwy+i+2zfogoe1pGPuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DesbyWaLhsQ+qKOKr4ISq4y5XJAuQ9sNCpHTG46/rA+9TM1KRAONhIzUJSfqBNxvDq+ZNPtEJv/A5DgIhIT2pPSRYBqtv5Qnxc7lO8NnCOiw4WD45xxUbIECZa+ZLjx2HwyIbR8ftXEoNV8ha91JUUaURXsuC6b6aYCqPoYsyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ih0YrXAC; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ih0YrXAC"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so25108615ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 22:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790833418; x=1791438218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgvrIEOpw88VrEORT9HbHbyuQrZfBbC4ttbFKpwgFuw=;
        b=ih0YrXAClCgFBCn9SASE45n0KaQdTZ8sJoUMQOnUf8WH3BD1LIfrruRykCRU1vYoeO
         +JIpWL81LBuL/fJHeNPsCvUMiL+CyjIGo2FipCNL00ln5x9BKDkDNI67yglabz31gfAG
         13ut3ETxcZHXx2pJII9NFqw7+srZD48spPcXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833418; x=1791438218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgvrIEOpw88VrEORT9HbHbyuQrZfBbC4ttbFKpwgFuw=;
        b=WecRpSENlaQrvpmZxk79AR53nZufsEXKHbd7VRqeMjXylQWaCPSBxIAKAVKvDzF6ak
         JhEqCecYNjcQP6FhVmYGDVRhypSkTyELk20ExZKtp2L77ra+q3TU3+5yeNul/Uofz5ht
         dKa0m/0RZwc/n+3KI1dnmKGV8eh6kHF4q88DFH+ykfoFtwUjojOQ+600YUYUjk3bt9Yv
         TK0125bJJ9X9uZebEbEn8wJcw5Ia1v0ygjmBkGht7Rqt1jooQ8AdKKxR6SCI1CmEfj/E
         usGiNJxsAO5QHyfvwdinDKujfMMDouRyju5LJAGNjgPILEohczCeO4QHQHxnm8KPZ+bT
         eiEg==
X-Forwarded-Encrypted: i=1; AKwUvBzAJOP++vfL/m2zEyYfvsGlW0vbFNrI4HzUNdR8IH7YqPCDSz0UU6XJfA7PJxqdD8zopNtYjt50Xgke6xm+@vger.kernel.org
X-Gm-Message-State: AFuF++ka4wkx2UVWBU5wVOpql16wmS3Oxpb0ntBOJCJPUHt6Y5PrsVV5
	wsOc2iljq7Ag3Dsr1WsTBkk8z03d80ZxCkVo1IR/yALrbvFJKs/zIzRjmnGyOz/p2w==
X-Gm-Gg: AYBFou0Z/JxQM0FDbKAbyj4ni/Ilnny49ggcFJbU9cH4PQgUMnRosbUcofMm8MY+ynd
	JY+kMjp2IsA3v/P9ul0sSxDeP5chL4hwD+12LogExZqfg2Rlx6YovBvPC/wnT3Nu4LjXMTHgW26
	ADpZ5HNZNgfyMAPm7DV5RAvV1DqaE5a45Rlfa1eaor6QzNXnhlUJ2kzhNqx4zemGJjxsS9LAsg7
	JNOlf2atwll66y8FwoB4znhtEvDiVpSq4heG87kF4RsFyg3/JPXFYHc17SsgBd0NqTopHSiM7bq
	cb1zJh0ZjToF18y/If53egjvfI/rVRb9PoGgMcJjnIvFR9DSg9nX9Y1D9VjT5zd6UbynduQaYYi
	VwirV3UsTsroaWTY4A2y0Uz/6qXoPo3QKuN1opuUSS2Q6IZBq6HLOH8ONA6jkV55LI7DHSd5PyF
	OLNCh52B8YIvkEpjtujDpF6TnpU/ZsYmCDvOeXinpV5clbTx2LQ2yDiBFwGBLOVij1SB8HOpjKb
	MOpJs0TYt//zSWpycahcl6mxdug/L3BO5zeIxP2LQcbp8veDA==
X-Received: by 2002:a17:903:3503:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e2e499e1c7mr26745355ad.21.1790833418058;
        Wed, 30 Sep 2026 22:43:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d042:b5fa:ebeb:ace6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30cc14cbbsm1942765ad.37.2026.09.30.22.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:43:37 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:43:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, minchan@kernel.org, 
	senozhatsky@chromium.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ar3yt8Kl3WUV93lP@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>

On (26/09/30 07:52), Georgi Djakov wrote:
[..]
> @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
>  
>  	while (backends[i]) {
>  		if (sysfs_streq(comp, backends[i]->name))
> -			break;
> +			return backends[i];
>  		i++;
>  	}
> -	return backends[i];
> +	return NULL;
>  }

This hunk looks unrelated to the patch in question.
