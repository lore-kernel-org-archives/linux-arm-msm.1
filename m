Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625F3E0097
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 16:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873001; cv=none; b=nyBdRXxw5Zn0y3y0NUl+ODdf45vYOmX5Kri5rs0rM85MTYPGX0FwVEUYxn+MXJov0Mf6ZFEzZupFU0LZsf7qG2XgqT3XDx1aK9eGPwOJCdhX2PdYKcrPYfbE5EPsdmzDBqJH/hHjBBrBK/6NVT5GobHPeWKfljTmOGwFucuCg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873001; c=relaxed/simple;
	bh=W4PILeefkdOVjbSJzmYUnfj1Vyf73SYXFL4zO1Cbe9I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VB333MSc5QWpDve+7KuWcGSU/cueESekCgxIknax3xlyx6xlrblIbAR/wSgWrpvih88pXeB5E68ZOo3LkiLV9l0jNtOLlqOgU6Gr33zb5mwc3cnbqQItVHA2gXz8ZgcpGAtwELxJmV5zRb3ocMBXJFv3AfHTC+7KZvNYQSInz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRtCScTs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRtCScTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FD11F00898;
	Thu,  1 Oct 2026 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790873000;
	bh=tU3mxgmhaXBmxpsw0rzRbg/pWn/nnPij3/vNs4HTw8o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=PRtCScTszC7aJh9BphMIWuduNvAbpMDuTP35DTDwvoVlK8g3A7IZTPBVLSz8RrP/i
	 CMeNtUTjOUz9Y/Hw0DI+c38kNMyIa+om1t1wHOGtiqzVnTpYS3l3fnP4+EUR1W8BQA
	 lYyJKqUNQxfhkUQCp7W3jqHqdIN4hoZtA6E9mpiRsoOnFKCavvmJRbfhFCFGTZMvOe
	 nyf5MW5CbIkXWkZiekUIh9v2bwg1uMPVHWT9aUmmCkK7Arokn/VXWpl9eNsk9Bh5kr
	 5ubPhhdGUlTaDoI5fh2xAIGJwGZa4n7rTPIWQGriXBTWWRd+vRT+3r2R3I3Tuej4ex
	 Dr2by1d/ojklw==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 18:43:13 +0200
Message-Id: <DLTNHRLY3O63.16FANFZDPKAPW@kernel.org>
Subject: Re: [PATCH v2 0/5] drm/gpuvm: two pass locking for exec
Cc: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Alice Ryhl"
 <aliceryhl@google.com>, "Anna Maniscalco" <anna.maniscalco2000@gmail.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>, "Liviu Dudau"
 <liviu.dudau@arm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Sean Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Steven Price" <steven.price@arm.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
To: "Matthew Brost" <matthew.brost@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261001162001.3123877-1-matthew.brost@intel.com>
In-Reply-To: <20261001162001.3123877-1-matthew.brost@intel.com>

On Thu Oct 1, 2026 at 6:19 PM CEST, Matthew Brost wrote:
>   drm/msm: use DRM_GPUVM_RESV_PROTECTED for VM_BIND VMs

That's great! But the title suggests there are other VMs without this?

I couldn't find a changelog for v2, can you share it please?
